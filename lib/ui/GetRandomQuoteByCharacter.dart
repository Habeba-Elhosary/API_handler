import 'package:flutter/material.dart';
import '../data/data_resourse/data_service.dart';
import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';

class GetRandomQuoteByCharacter extends StatefulWidget {
  const GetRandomQuoteByCharacter({Key? key}) : super(key: key);

  @override
  State<GetRandomQuoteByCharacter> createState() => _GetRandomQuoteByCharacter();
}

class _GetRandomQuoteByCharacter extends State<GetRandomQuoteByCharacter> {
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  late QuoteModel quotes ;
  bool isLoading = true;

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  void getRequest() async {
    quotes = await quoteRepository.getRandomQuoteByCharacter(character: "naruto");
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

