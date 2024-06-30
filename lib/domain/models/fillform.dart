import 'package:svoi/domain/models/visa_models/reason_model.dart';

class FillForm {
  List<FormModel> initReasonsF4() {
    List<FormModel> reasons = [];
    FormModel reasons1 = FormModel(formName: "впервые выпуск", formCode: "");
    reasons.add(reasons1);
    FormModel reason2 =
        FormModel(formName: "смена адреса места жительства", formCode: "");
    reasons.add(reason2);
    FormModel reasons3 = FormModel(formName: "перевыпуск", formCode: "");
    reasons.add(reasons3);
    FormModel reasons4 = FormModel(formName: "продление", formCode: "");
    reasons.add(reasons4);
    FormModel reasons5 =
        FormModel(formName: "смена статуса визы", formCode: "");
    reasons.add(reasons5);
    FormModel reasons6 = FormModel(formName: "получение", formCode: "");
    reasons.add(reasons6);
    return reasons;
  }

  List<FormModel> initGender() {
    List<FormModel> result = [];
    FormModel male = FormModel(formName: "М", formCode: "");
    result.add(male);
    FormModel female = FormModel(formName: "Ж", formCode: "");
    result.add(female);
    return result;
  }
}
