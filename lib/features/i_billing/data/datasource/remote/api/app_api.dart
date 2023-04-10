import 'package:flutter/foundation.dart';

import '../model/user_contract.dart';
import '../model/user_invoice.dart';
import 'api_base.dart';

class AppApi {
  final ApiBase _apiBase;

  AppApi(this._apiBase);

//get all contracts
  Future<List<UserContractData>> contracts() async {
    final response = await _apiBase.dio.get('/contracts');
    return List<UserContractData>.from(
        response.data.map((e) => UserContractData.fromJson(e)));
  }

//get all invoices
  Future<List<InvoiceData>> invoices() async {
    final response = await _apiBase.dio.get('/invoices');
    return List<InvoiceData>.from(
        response.data.map((e) => InvoiceData.fromJson(e)));
  }

//get dateFiltered contracts
  Future<List<UserContractData>> getContractsWithDate(
    int startTime,
    int endTime,
  ) async {
    final response = await _apiBase.dio.get('/contracts');
    if (response.statusCode == 200) {
      var newList = List<UserContractData>.from(
          response.data.map((e) => UserContractData.fromJson(e)));
      return newList
          .where((element) => (element.createdData! >= startTime &&
              element.createdData! <= endTime))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  //get dateFiltered invoices

  Future<List<InvoiceData>> getInvoicesWithDate(
    int startTime,
    int endTime,
  ) async {
    final response = await _apiBase.dio.get('/invoices');
    if (response.statusCode == 200) {
      var newList = List<InvoiceData>.from(
          response.data.map((e) => InvoiceData.fromJson(e)));
      return newList
          .where((element) => (element.createdDate! >= startTime &&
              element.createdDate! <= endTime))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserContractData>> searchByQuery({String? query}) async {
    List<UserContractData> results = [];
    try {
      final response = await _apiBase.dio.get("/contracts");
      if (response.statusCode == 200) {
        results = List<UserContractData>.from(
            response.data.map((e) => UserContractData.fromJson(e))).toList();
        if (query != null) {
          return results
              .where((element) => element.fullName!
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }

  Future<UserContractData?> deleteContract(String index) async {
    final response = await _apiBase.dio.delete('/contracts/$index');
    if (response.statusCode == 200) {
      return UserContractData();
    } else {
      return null;
    }
  }

  Future<UserContractData?> addContract() async {
    final response = await _apiBase.dio.post('/contracts');
    if (response.statusCode == 200) {
      return UserContractData();
    } else {
      return null;
    }
  }

  Future<InvoiceData?> addInvoice() async {
    final response = await _apiBase.dio.post('/invoices');
    if (response.statusCode == 200) {
      return InvoiceData();
    } else {
      return null;
    }
  }

  Future<List<UserContractData>> getSavedContracts() async {
    List<UserContractData> results = [];
    try {
      final response = await _apiBase.dio.get("/contracts");
      if (response.statusCode == 200) {
        results = List<UserContractData>.from(
            response.data.map((e) => UserContractData.fromJson(e))).toList();

        return results.where((element) => element.isSaved == true).toList();
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }

  Future<List<InvoiceData>> getSavedInvoices() async {
    List<InvoiceData> results = [];
    try {
      final response = await _apiBase.dio.get("/invoices");
      if (response.statusCode == 200) {
        results = List<InvoiceData>.from(
            response.data.map((e) => InvoiceData.fromJson(e))).toList();

        return results.where((element) => element.isSaved == true).toList();
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }



  Future<List<UserContractData>> filterContracts(
    List<String> statuses,
    int startTime,
    int endTime,
  ) async {
    final response = await _apiBase.dio.get('/contracts');
    var length = statuses.length;
    if (response.statusCode == 200) {
      var newList = List<UserContractData>.from(
          response.data.map((e) => UserContractData.fromJson(e)));
      if (length == 1) {
        return newList
            .where((element) => (element.createdData! >= startTime &&
                element.createdData! <= endTime &&
                (element.status!.contains(statuses[0]))))
            .toList();
      } else if (length == 2) {
        return newList
            .where((element) => (element.createdData! >= startTime &&
                element.createdData! <= endTime &&
                (element.status!.contains(statuses[0]) ||
                    element.status!.contains(statuses[1]))))
            .toList();
      } else if (length == 3) {
        return newList
            .where((element) => (element.createdData! >= startTime &&
                element.createdData! <= endTime &&
                (element.status!.contains(statuses[0]) ||
                    element.status!.contains(statuses[1]) ||
                    element.status!.contains(statuses[2]))))
            .toList();
      } else {
        return newList
            .where((element) => (element.createdData! >= startTime &&
                element.createdData! <= endTime))
            .toList();
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
