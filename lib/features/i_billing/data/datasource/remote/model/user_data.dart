class UserData {
  final int currentInvoice;
  final String fullName;
  final Status status;
  final int amount;
  final int lastInvoice;
  final int numberOfInvoice;
  final String adress;
  final int itn;
  final String createdData;

  const UserData(
      {required this.currentInvoice,
      required this.fullName,
      required this.status,
      required this.amount,
      required this.lastInvoice,
      required this.numberOfInvoice,
      required this.adress,
      required this.itn,
      required this.createdData});
}

enum Status {
  paid,
  inProcess,
  rejectedByPayme,
  rejectedByIQ,
}

List<UserData> userList = [
  const UserData(
      fullName: "Yoldosheva Ziyoda",
      status: Status.paid,
      amount: 1200000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 156),
  const UserData(
      fullName: "jdnf ndjcndifj",
      status: Status.inProcess,
      amount: 1300000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 152),
  const UserData(
      fullName: "fer ferfe",
      status: Status.rejectedByIQ,
      amount: 1600000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 150),
  const UserData(
      fullName: "efebv sfaev",
      status: Status.rejectedByPayme,
      amount: 1500000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 160),
  const UserData(
      fullName: "fgsv byrsgv",
      status: Status.paid,
      amount: 1400000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 120),
  const UserData(
      fullName: "nfiuer huifc f",
      status: Status.paid,
      amount: 160000,
      lastInvoice: 4188252,
      numberOfInvoice: 6,
      adress: "Tashkent",
      itn: 123,
      createdData: "14:38, 2 February, 2021",
      currentInvoice: 135)
];
