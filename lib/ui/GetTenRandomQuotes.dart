import 'package:flutter/material.dart';
import '../data/data_resourse/data_service.dart';
import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';

class GetTenRandomQuotes extends StatefulWidget {
  const GetTenRandomQuotes({Key? key}) : super(key: key);

  @override
  State<GetTenRandomQuotes> createState() => _GetTenRandomQuotes();
}

class _GetTenRandomQuotes extends State<GetTenRandomQuotes> {
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  List<QuoteModel> quotes = [];
  bool isLoading = true;

  @override
  void initState() {
      getRequest();
      super.initState();
    }

    void getRequest() async {
      quotes = await quoteRepository.getTenRandomQuote();
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
                        title: Text(quotes[index].quote),
                      )),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 10),
                  itemCount: quotes.length),
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
