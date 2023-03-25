import 'package:flutter/material.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Center(
            child: Column(
             children: [
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetTenRandomQuotes');},
                 child: const Text('Get 10 random quotes')),
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetTenRandomQuotesByTitle');},
                 child: const Text('Get 10 quotes by anime title')),
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetTenRandomQuoteByCharacter');},
                 child: const Text('Get 10 quotes by anime character')),
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetRandomQuote');},
                 child: const Text('Get Random Quote')),
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetRandomQuoteByTitle');},
                 child: const Text('Get a random quote by title')),
             ElevatedButton(onPressed: (){Navigator.pushNamed(context,'GetRandomQuoteByCharacter');},
                 child: const Text('Get a random quote by character')),

        ],
      ),
          )
    );
  }
}