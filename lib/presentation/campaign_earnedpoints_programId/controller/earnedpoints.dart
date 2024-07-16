import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earnedpoints_programId/model/trasnactionmodel.dart';
import 'package:incentivesgit/presentation/campaign_earnedpoints_programId/service/campaignsearnedpointsservice.dart';

class CampaignEarnedPointsController1 extends GetxController {
  var searchQuery = ''.obs;
  var isLoading = true.obs;

  // Example data for dropdowns
  var campaigns = <String?>[].obs;
  var year = <String>[].obs;

  // Transactions list
  var transactions = <Transaction>[].obs;

  // Value holders for dropdowns
  var campaignsValue = Rx<String?>(null);
  var yearValue = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    yeardropdown();

    // Add listener to observe changes in selected year
    ever(yearValue, (String? selectedYear) {
      if (selectedYear == 'All') {
        transactionhistoryAll(); // Fetch all transactions
      } else {
        transactionhistory(int.parse(
            selectedYear!)); // Fetch transactions for the selected year
      }
    });

    // Initially fetch all transactions
    transactionhistoryAll();
  }

  void yeardropdown() async {
    isLoading.value = true;
    try {
      var yearValues = await CampaignEarnedPointsService().yearDropdown();
      if (yearValues.isNotEmpty) {
        year.value = ['All', ...yearValues.map((year) => year.toString())];
        yearValue.value = 'All'; // Initialize yearValue with 'All'
      }
    } catch (e) {
      print("Failed to fetch year: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void transactionhistory(int selectedYear) async {
    isLoading.value = true;
    try {
      var result =
          await CampaignEarnedPointsService().transactiondata(selectedYear);
      if (result.isNotEmpty) {
        var earnedTransactions = result
            .where(
                (transaction) => transaction.transactionType == 'distributed')
            .toList();
        transactions.assignAll(earnedTransactions);
      } else {
        transactions.clear();
      }
    } catch (e) {
      print('Exception : $e');
    } finally {
      isLoading.value = false;
    }
  }

  void transactionhistoryAll() async {
    isLoading.value = true;
    try {
      var result = await CampaignEarnedPointsService().transactiondataAll();
      if (result.isNotEmpty) {
        var earnedTransactions = result
            .where(
                (transaction) => transaction.transactionType == 'distributed')
            .toList();
        transactions.assignAll(earnedTransactions);
      } else {
        transactions.clear();
      }
    } catch (e) {
      print('Exception : $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<Transaction> get filteredTransactions {
    if (searchQuery.value.isEmpty) {
      // Return all transactions if no search query
      return transactions;
    } else {
      // Filter transactions based on search query
      return transactions.where((transaction) {
        final transactionName = transaction.programName!.toLowerCase();
        return transactionName.contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }
}
