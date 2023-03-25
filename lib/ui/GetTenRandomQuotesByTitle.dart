import 'package:flutter/material.dart';
import '../data/data_resourse/data_service.dart';
import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';

class GetTenRandomQuotesByTitle extends StatefulWidget {
  const GetTenRandomQuotesByTitle({Key? key}) : super(key: key);

  @override
  State<GetTenRandomQuotesByTitle> createState() => _GetTenRandomQuotesByTitle();
}

class _GetTenRandomQuotesByTitle extends State<GetTenRandomQuotesByTitle> {
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  List<QuoteModel> quotes = [];
  bool isLoading = true;

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  void getRequest() async {
    quotes = await quoteRepository.getTenRandomQuoteByTitle(title: "naruto");
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
