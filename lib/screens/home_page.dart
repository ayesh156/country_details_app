import 'package:country_details_app/components/details_text.dart';
import 'package:country_details_app/model/country_data_model.dart';
import 'package:country_details_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();

  TextEditingController textController = TextEditingController();

  String userPost = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Text(
                    "Country Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  Icon(Icons.favorite)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: size.width * 0.50,
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Country Name"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        userPost = textController.text;
                      });
                    },
                    height: 60,
                    color: Colors.blue,
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: service.getData(name: userPost),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    CountryDataModel data = snapshot.data!;
                    return Column(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Link(
                        uri: Uri.parse(data.googleMap.toString()),
                        target: LinkTarget.defaultTarget,
                        builder: (context, openLink) => TextButton(
                          onPressed: openLink,
                          child:Text(
                            data.commonName.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                        ),
                      ),
                       ),
                       Container(
                            width: double.infinity,
                            height: size.height * 0.25,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(data.flagUrl.toString()))),
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailsText(
                              keyText: "Official Name : ",
                              valueText: data.officialName.toString(),
                            ),
                            DetailsText(
                                keyText: "Capital City : ",
                                valueText: data.capital.toString()),
                            DetailsText(
                                keyText: "Area : ",
                                valueText: data.area.toString()),
                            DetailsText(
                                keyText: "Population : ",
                                valueText: data.population.toString()),
                            DetailsText(
                                keyText: "Region : ",
                                valueText: data.region.toString()),
                            DetailsText(
                                keyText: "Sub Region : ",
                                valueText: data.subregion.toString()),
                            DetailsText(
                                keyText: "Continents : ",
                                valueText: data.continents.toString()),
                            DetailsText(
                                keyText: "Timezones : ",
                                valueText: data.timezones.toString()),
                            DetailsText(
                                keyText: "Start Of Week : ",
                                valueText: data.startOfWeek.toString()),
                            DetailsText(
                                keyText: "Top Level Domain : ",
                                valueText: data.tld.toString()),
                            DetailsText(
                                keyText: "Alt Spellings : ",
                                valueText: data.spellings.toString()),
                          ],
                        ),
                      )
                    ]);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
