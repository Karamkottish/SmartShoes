import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Data/DataBaseModel.dart';
import 'package:smart_shoes/Data/DataSources/DataSourcsesProviders.dart';
import 'package:smart_shoes/Data/Models.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/ColorManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';
import '../../../../Data/FirebaseModel.dart';
import '../../../../Data/Providers/ProfileProviders.dart';
import '../../_Resources/ValueManager.dart';

class ProfileView1 extends ConsumerWidget {
  const ProfileView1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child: AppBar(
            title: const Text(StringManager.profile),
          )),
      backgroundColor: ColorManager.surface,
      body: ref.watch(profileControllerProvider).when(
          data: (_) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPaddingManager.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height: 80,
                        child:
                            Image(image: AssetImage(ImageAssetsManager.Logo))),
                    infoContainer(
                      Column(children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              ref
                                  .watch(profileControllerProvider.notifier)
                                  .welcome,
                              style: Theme.of(context).textTheme.headlineSmall),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppPaddingManager.p18),
                      child: infoContainer(
                        Column(children: [
                          Text(
                              ref
                                  .watch(profileControllerProvider.notifier)
                                  .email,
                              style: Theme.of(context).textTheme.headlineSmall)
                        ]),
                      ),
                    ),
                    infoContainer(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ref.watch(profileControllerProvider.notifier).age,
                            style: Theme.of(context).textTheme.headlineSmall),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddingManager.p18),
                          child: Text(
                              ref
                                  .watch(profileControllerProvider.notifier)
                                  .weight,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Text(
                            ref
                                .watch(profileControllerProvider.notifier)
                                .height,
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    )),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, RouteManager.editRoute),
                      child: Text(StringManager.edit,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    TextButton(
                      onPressed: () async {
                        await ref.read(fireBaseProviderAuthRepo).logout();
                        Navigator.pushReplacementNamed(
                          context, RouteManager.loginRoute);
                      },
                      child: Text(StringManager.logout,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ],
                ),
              ),
          error: (error, stackTrace) =>
              Center(child: Text("Something Went Wrong :(\n error: $error")),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }

  Widget infoContainer(Column data) => Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.all(AppPaddingManager.p9),
      decoration: BoxDecoration(
          color: ColorManager.primaryContainer,
          borderRadius: BorderRadius.circular(16)),
      child: data);
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  DataBase db = DataBase.instance;
  late Future<Person> futurePerson;
  File? image;

  late FirebaseModel dbModel;
  late Future<UserModelOld> userModel;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    futurePerson = getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: const Text("Profile"),
          )),
      backgroundColor: ColorManager.surface,
      body: FutureBuilder<Person>(
          future: futurePerson,
          builder: (BuildContext context, AsyncSnapshot<Person> snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(children: [
                                  Container(
                                      height: 100,
                                      decoration: const BoxDecoration(
                                          color: ColorManager.surface)),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: ColorManager.primaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    RouteManager.editRoute),
                                            child: Text("Edit",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "Hi, ${snapshot.data!.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    child: image != null
                                        ? Image.file(image!)
                                        : Container()),
                              ],
                            ),
                            const SizedBox(height: 20),
                            infoContainer(Column(children: [
                              Text("Email: ${snapshot.data!.email}",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall)
                            ])),
                            const SizedBox(height: 20),
                            infoContainer(Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Age: ${DateTime.now().year - snapshot.data!.birthYear} Years Old",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                const SizedBox(height: 10),
                                Text("Weight: ${snapshot.data!.weight} Kg",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                const SizedBox(height: 10),
                                Text("Height: ${snapshot.data!.height} Cm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall)
                              ],
                            )),
                            const SizedBox(height: 20),
                            const Row(
                              children: [
                                SizedBox(
                                    height: 50,
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Image(
                                            image: AssetImage(
                                                ImageAssetsManager.Logo)))),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }


  Widget infoContainer(Column data) {
    return Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorManager.primaryContainer,
            borderRadius: BorderRadius.circular(16)),
        child: data);
  }

  Future<UserModelOld> getUserData() async {
    return await dbModel.getUserInfo();
  }

  Future<Person> getLocalData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = sharedPreferences.getString("currentUser")!;
    Person person = await db.getPersonByEmail(user);
    if (person.image.isNotEmpty) {
      image = await saveImage(person.image);
    }
    return person;
  }

  Future<File?> saveImage(String path) async {
    var directory = await getApplicationDocumentsDirectory();
    var name = path.split("/").last;
    var image = File("${directory.path}/$name");
    return File(path).copy(image.path);
  }
}

/*
image frame
Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(children: [
                                  Container(
                                      height: 100,
                                      decoration: const BoxDecoration(
                                          color: ColorManager.surface)),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: ColorManager.primaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    RouteManager.editRoute),
                                            child: Text("Edit",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "Hi, ${snapshot.data!.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    child: image != null
                                        ? Image.file(image!)
                                        : Container()),
                              ],
                            ),

 */
