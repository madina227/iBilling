abstract class NewInvoiceEvent {}

class GetNameEvent extends NewInvoiceEvent {
  String name;

  GetNameEvent(this.name);
}

class GetCostEvent extends NewInvoiceEvent {
  String cost;

  GetCostEvent(this.cost);
}

class ChooseStatusEvent extends NewInvoiceEvent {
  String choosedStatus;

  ChooseStatusEvent(this.choosedStatus);
}

class SaveInvoiceEvent extends NewInvoiceEvent {
  String name;
  String cost;
  String sts;

  SaveInvoiceEvent(this.name, this.cost, this.sts);
}
