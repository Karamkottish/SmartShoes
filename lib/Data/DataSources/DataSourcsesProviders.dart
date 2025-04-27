import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/Data/DataSources/Firebase/FirebaseAuthRepo.dart';
import 'package:smart_shoes/Data/DataSources/Firebase/FirebaseStoreRepo.dart';

Provider<FirebaseAuthRepository> fireBaseProviderAuthRepo =
    Provider<FirebaseAuthRepository>((ref) => FirebaseAuthRepository(
        ref: ref,
        auth: FirebaseAuth.instance,
        fireStore: FirebaseFirestore.instance));

StreamProvider<User?> fireBaseProviderAuthStream = StreamProvider((ref) => ref
    .read(fireBaseProviderAuthRepo.select((value) => value.authStateStream)));

Provider<FirebaseStoreRepository> fireBaseProviderStoreRepo = Provider((ref) =>
    FirebaseStoreRepository(fireStore: FirebaseFirestore.instance, ref: ref));
