import 'package:flutter/material.dart';
import '../data/data_resourse/data_service.dart';
import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';

class GetRandomQuote extends StatefulWidget {
  const GetRandomQuote({Key? key}) : super(key: key);

  @override
  State<GetRandomQuote> createState() => _GetRandomQuote();
}

class _GetRandomQuote extends State<GetRandomQuote> {
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  late QuoteModel quotes ;
  bool isLoading = true;

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  void getRequest() async {
    quotes = await quoteRepository.getRandomQuote();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(quotes.quote),
                      )),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 10),
                  itemCount:1),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

