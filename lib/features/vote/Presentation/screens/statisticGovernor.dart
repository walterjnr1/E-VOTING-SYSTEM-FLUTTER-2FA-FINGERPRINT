import 'dart:developer';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class statisticGovernor extends StatefulWidget {
  @override
  _statisticGovernorState createState() => _statisticGovernorState();
}

class _statisticGovernorState extends State<statisticGovernor> {
  bool isLoading = false;

  int _currentPage = 1;
  int _pageSize = 10;
  List<CandidateModel> _data = [];
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
        '${URL_PREFIX}/getGovernorResult?page=$_currentPage')); //&pageSize=$_pageSize

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      inspect(jsonData);
      final dataList = jsonData['data'] as List<dynamic>;

      final List<CandidateModel> newData =
          dataList.map((item) => CandidateModel.fromJson(item)).toList();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Governorship Election Result',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  horizontalMargin:
                      12, // adjust this value to reduce the horizontal margin between columns
                  columnSpacing:
                      12, // adjust this value to reduce the space between each column
                  header: Text('Scroll Horizontally to See all Fields ',
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
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Image')),
                    DataColumn(label: Text('Votes')),
                    DataColumn(label: Text('Party')),
                  ],
                  source: _DataSource(data: _data),
                ),
              ),
            ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<CandidateModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    final item = data[index];
    return DataRow(cells: [
      DataCell(index == 0
          ? Text('${item.fullname.toString()}-Leading',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColor,
              ))
          : Text(item.fullname.toString())),
      DataCell(CircleAvatar(
        backgroundImage: NetworkImage('${img_url}/${item.image}'),
      )),
      DataCell(Center(child: Text(item.count.toString()))),
      DataCell(Text(item.party.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
