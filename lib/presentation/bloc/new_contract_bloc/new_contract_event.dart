abstract class NewContractEvent {}

class ChooseLitsoEvent extends NewContractEvent {
  String choosedLitso;

  ChooseLitsoEvent(this.choosedLitso);
}

class GetFullName extends NewContractEvent {
  String fullName;

  GetFullName(this.fullName);
}

class GetAdress extends NewContractEvent {
  String adress;

  GetAdress(this.adress);
}

class GetInn extends NewContractEvent {
  String inn;

  GetInn(this.inn);
}

class ChooseStatusEvent extends NewContractEvent {
  String choosedStatus;

  ChooseStatusEvent(this.choosedStatus);
}

class SaveContractEvent extends NewContractEvent {
  String litso;
  String fullName;
  String adress;
  String inn;
  String sts;

  SaveContractEvent(this.litso, this.fullName, this.adress, this.inn, this.sts);
}
