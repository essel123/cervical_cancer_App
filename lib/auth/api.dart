// ignore_for_file: non_constant_identifier_names

import 'package:cervical_cancer_prediction/auth/request.dart';
import 'package:http/http.dart' as http;

class MyRequest {
  final double Age;
  final double Number_of_sexual_partners;
  final double First_sexual_intercourse;
  final double Num_of_pregnancies;
  final double Smokes;
  final double Smokes_Years;
  final double Smokes_pack_per_year;
  final double Hormonal_Contraceptives;
  final double Hormonal_Contraceptives_years;
  final double IUD;
  final double IUD_years;
  final double STDs;
  final double Number_of_diagnosis;
  final double Time_since_last_diagnosis;

  MyRequest({
    required this.Age,
    required this.Number_of_sexual_partners,
    required this.First_sexual_intercourse,
    required this.Num_of_pregnancies,
    required this.Smokes,
    required this.Smokes_Years,
    required this.Smokes_pack_per_year,
    required this.Hormonal_Contraceptives,
    required this.Hormonal_Contraceptives_years,
    required this.IUD,
    required this.IUD_years,
    required this.STDs,
    required this.Number_of_diagnosis,
    required this.Time_since_last_diagnosis,
  });

  Map<String, dynamic> toJson() {
    return {
      "Age": Age,
      "Number_of_sexual_partners": Number_of_sexual_partners,
      "First_sexual_intercourse": First_sexual_intercourse,
      "Num_of_pregnancies": Num_of_pregnancies,
      "Smokes": Smokes,
      "Smokes_Years": Smokes_Years,
      "Smokes_pack_per_year": Smokes_pack_per_year,
      "Hormonal_Contraceptives": Hormonal_Contraceptives,
      "Hormonal_Contraceptives_years": Hormonal_Contraceptives_years,
      "IUD": IUD,
      "IUD_years": IUD_years,
      "STDs": STDs,
      "Number_of_diagnosis": Number_of_diagnosis,
      "Time_since_last_diagnosis": Time_since_last_diagnosis
    };
  }
}






 Future<Prediction?> Sendrequest(
    double Age,
    double Number_of_sexual_partners,
    double First_sexual_intercourse,
    double Num_of_pregnancies,
    double Smokes,
    double Smokes_Years,
    double Smokes_pack_per_year,
    double Hormonal_Contraceptives,
    double Hormonal_Contraceptives_years,
    double IUD,
    double IUD_years,
    double STDs,
    double Number_of_diagnosis,
    double Time_since_last_diagnosis,
  ) async {
    const apiUrl = 'https://ml-api-i2am.onrender.com';

  
    final response = await http.post(apiUrl as Uri, body: {
      "Age": Age,
      "Number_of_sexual_partners": Number_of_sexual_partners,
      "First_sexual_intercourse": First_sexual_intercourse,
      "Num_of_pregnancies": Num_of_pregnancies,
      "Smokes": Smokes,
      "Smokes_Years": Smokes_Years,
      "Smokes_pack_per_year": Smokes_pack_per_year,
      "Hormonal_Contraceptives": Hormonal_Contraceptives,
      "Hormonal_Contraceptives_years": Hormonal_Contraceptives_years,
      "IUD": IUD,
      "IUD_years": IUD_years,
      "STDs": STDs,
      "Number_of_diagnosis": Number_of_diagnosis,
      "Time_since_last_diagnosis": Time_since_last_diagnosis
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return predictionFromJson(responseString);
    } else {
      return null;
    }
  }


