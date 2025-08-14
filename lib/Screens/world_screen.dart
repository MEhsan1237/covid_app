import 'package:covid_app/Screens/details.screen.dart';
import 'package:covid_app/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CountriesStatesClass countriesStatesClass = CountriesStatesClass();

    return Scaffold(
      appBar: AppBar(centerTitle: true,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios_outlined,size: 18,),highlightColor: Colors.deepPurpleAccent,),
        backgroundColor: Colors.blue,
        title: Center(
            child: Text("Country Details")
        ),),

      body: SafeArea(

        child: FutureBuilder(
          future: countriesStatesClass.fitchCountriesStatesApi(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white70,
                    highlightColor: Colors.white38,
                    child: ListTile(
                      leading: Container(width: 70, height: 70, color: Colors.white),
                      title: Container(height: 10, color: Colors.white),
                      subtitle: Container(height: 10, color: Colors.white),
                    ),
                  );
                },
              );
            } else {
              final countries = snapshot.data!;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) => setState(() {}),
                      onFieldSubmitted: (value) {
                        final match = countries.firstWhere(
                              (country) => country['country']
                              .toString()
                              .toLowerCase()
                              .trim() == value.toLowerCase().trim(),
                          orElse: () => null,
                        );

                        if (match != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                image: match["countryInfo"]["flag"],
                                name: match["country"],
                                totalCases: match["cases"],
                                deathCases: match["deaths"],
                                todayRecovered: match["todayRecovered"],
                                active: match["active"],
                                critical: match["critical"],
                                test: match["tests"],
                                recoveredCases: match["recovered"],
                                oneCasePerPeople: match["oneCasePerPeople"],
                                deathsPerOneMillion: match["deathsPerOneMillion"],
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Country not found")),
                          );
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        hintText: "Search any country",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: const Icon(Icons.search, size: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        final name = country["country"];

                        if (searchController.text.isEmpty ||
                            name.toLowerCase().contains(searchController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    image: country["countryInfo"]["flag"],
                                    name: country["country"],
                                    totalCases: country["cases"],
                                    deathCases: country["deaths"],
                                    todayRecovered: country["todayRecovered"],
                                    active: country["active"],
                                    critical: country["critical"],
                                    test: country["tests"],
                                    recoveredCases: country["recovered"],
                                    oneCasePerPeople: country["oneCasePerPeople"],
                                    deathsPerOneMillion: country["deathsPerOneMillion"],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Image.network(
                                country["countryInfo"]["flag"],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                              title: Text(name),
                              subtitle: Text(country["cases"].toString()),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
