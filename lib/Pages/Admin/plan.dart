import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pura_new/component/addPlan.dart';

import '../../commonPage/header.dart';
import '../../component/addCampagin.dart';
import '../../constants/constant.dart';
import '../../widget/text.dart';

class Plan extends StatefulWidget {
  const Plan({super.key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  List result = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    getAllCampagins();
    socket.on('getCampagin', (data) {
      print(data);
      if (mounted) {
        setState(() {
          result = data;
        });

        isLoading = false;
      }
    });
    socket.on('deleteCampagin', (data) {
      getAllCampagins();
    });
    socket.on('activateCampagin', (data) {
      getAllCampagins();
    });
    socket.on('deactivateCampagin', (data) {
      getAllCampagins();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getAllCampagins() {
    socket.emit('getAllCampagins', 'state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Header(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.teal,
                            width: 1.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.teal,
                            )
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: textWidget('Plan List', '40',
                                        FontWeight.bold, Colors.teal),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 10),
                                      itemCount: result.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 10, left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey[100],
                                          boxShadow: const [BoxShadow()],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Row(
                                            children: [
                                              // ignore: prefer_interpolation_to_compose_strings
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    socketUrl +
                                                        result[index]['image'],
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),

                                              Expanded(
                                                flex: 8,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        textWidget(
                                                            'name : ',
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.teal),
                                                        textWidget(
                                                            result[index]
                                                                ['name'],
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.black)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        textWidget(
                                                            'Vendor : ',
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.teal),
                                                        textWidget(
                                                            result[index]
                                                                ['vendor'],
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.black)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        textWidget(
                                                            'url : ',
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.teal),
                                                        Flexible(
                                                          child: textWidget(
                                                              result[index]
                                                                  ['url'],
                                                              '14',
                                                              FontWeight.w500,
                                                              Colors.black),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        textWidget(
                                                            'Payout : ',
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.teal),
                                                        textWidget(
                                                            result[index]
                                                                    ['payout']
                                                                .toString(),
                                                            '14',
                                                            FontWeight.w500,
                                                            Colors.black)
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        result[index][
                                                                    'isActive'] ==
                                                                1
                                                            ? Flexible(
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ButtonStyle(
                                                                      backgroundColor: MaterialStateProperty.all(const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          7,
                                                                          155,
                                                                          98))),
                                                                  // color: teal,
                                                                  child:
                                                                      Flexible(
                                                                    child: textWidget(
                                                                        'De - Activate',
                                                                        '15',
                                                                        FontWeight
                                                                            .w400,
                                                                        Colors
                                                                            .white),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _deActivate(
                                                                        result[index]
                                                                            [
                                                                            '_id']);
                                                                  },
                                                                ),
                                                              )
                                                            : Flexible(
                                                                child:
                                                                    ElevatedButton(
                                                                  // color: teal,
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(const Color.fromARGB(
                                                                            255,
                                                                            7,
                                                                            155,
                                                                            98)),
                                                                  ),
                                                                  child:
                                                                      Flexible(
                                                                    child: textWidget(
                                                                        'Activate',
                                                                        '15',
                                                                        FontWeight
                                                                            .w400,
                                                                        Colors
                                                                            .white),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _activate(result[
                                                                            index]
                                                                        [
                                                                        '_id']);
                                                                  },
                                                                ),
                                                              ),
                                                        Flexible(
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all(
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            7,
                                                                            155,
                                                                            98))),
                                                            // color: teal,
                                                            child: Flexible(
                                                              child: textWidget(
                                                                  'Delete',
                                                                  '15',
                                                                  FontWeight
                                                                      .w400,
                                                                  Colors.white),
                                                            ),
                                                            onPressed: () {
                                                              delete(
                                                                  result[index]
                                                                      ['_id']);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.teal,
                            width: 1.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: const AddPlan()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void delete(id) {
    socket.emit('deleteCampagin', id);
  }

  void _deActivate(id) {
    socket.emit('deactivateCampagin', id);
  }

  void _activate(id) {
    socket.emit('activateCampagin', id);
  }
}
