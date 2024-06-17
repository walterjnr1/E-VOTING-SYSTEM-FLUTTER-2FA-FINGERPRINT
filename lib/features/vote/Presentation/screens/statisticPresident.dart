import 'dart:developer';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/error_internet_connection.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_party_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class statisticPresident extends StatefulWidget {
  @override
  _statisticPresidentState createState() => _statisticPresidentState();
}

class _statisticPresidentState extends State<statisticPresident> {
  bool isLoading = false;

  int _currentPage = 1;
  int _pageSize = 10;
  List<CandidatePartyModel> _data = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        '${URL_PREFIX}/getPresidentResult?page=$_currentPage')); //&pageSize=_pageSize

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      inspect(jsonData);
      final dataList = jsonData['data'] as List<dynamic>;

      final List<CandidatePartyModel> newData =
          dataList.map((item) => CandidatePartyModel.fromJson(item)).toList();

      setState(() {
        _data.addAll(newData);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to fetch Result');
    }
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      fetchData();
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
      _data.clear(); // Clear the data list before fetching new data
    });

    await fetchData();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
     final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

    if (!internetConnectionProvider.hasInternet) {
      // If there's no internet connection, push to a new route
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'No internet Connection. Try Again',
          ),
        );
      });
    }
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Presidential Election Result',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    horizontalMargin:
                        12, // adjust this value to reduce the horizontal margin between columns
                    columnSpacing:
                        12, // adjust this value to reduce the space between each column
                    header: Text(
                        'Scroll Vertically and Horizontally to See all Records and columns ',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: errorcolour,
                        )),
                    rowsPerPage: _pageSize,
                    availableRowsPerPage: const [10, 25, 50],
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        _pageSize = value!;
                      });
                    },

                    columns: const [
                      DataColumn(
                          label: Text('Candidate Name',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: successcolour,
                              ))),
                      DataColumn(
                          label: Text('Image',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: successcolour,
                              ))),
                      DataColumn(
                          label: Text('Votes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: successcolour,
                              ))),
                      DataColumn(
                          label: Text('Party',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: successcolour,
                              ))),
                    ],
                    source: _DataSource(data: _data),
                  ),
                ),
              ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<CandidatePartyModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    final item = data[index];
    return DataRow(cells: [
      DataCell(index == 0 &&
              data[index].count !=
                  data[index > 0 ? index - 1 : data.length - 1].count
          ? Text('${item.fullname}-Leading',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColor,
              ))
          : Text(item.fullname.toString(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: fontcolour2,
              ))),
      DataCell(CircleAvatar(
        backgroundImage: NetworkImage('${img_url}/${item.image}'),
      )),
      DataCell(Center(
          child: Text(item.count.toString(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: fontcolour2,
              )))),
      DataCell(Text(item.party.toString(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: fontcolour2,
          ))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
