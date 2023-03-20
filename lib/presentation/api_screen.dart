import 'package:api_handler/data/repositories/quote_repository.dart';
import 'package:flutter/material.dart';
import '../data/data_resource/api_service.dart';
import '../data/models/quote_model.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Card(
                            child: ListTile(
                          title: Text(quotes[index].quote),
                        )),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: quotes.length),
              ),
              const SizedBox(height: 10,),
            ],
          ),
    );
  }
}
