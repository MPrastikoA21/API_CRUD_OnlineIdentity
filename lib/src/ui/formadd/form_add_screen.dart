import 'package:flutter/material.dart';
import '/src/api/api_service.dart';
import '/src/model/profile.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Profile profile;

  FormAddScreen({this.profile});

  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNameValid;
  bool _isFieldNIMValid;
  bool _isFieldKelasValid;
  bool _isFieldInstansiValid;
  bool _isFieldTglValid;
  bool _isFieldEmailValid;
  bool _isFieldAgeValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerNIM = TextEditingController();
  TextEditingController _controllerKelas = TextEditingController();
  TextEditingController _controllerInstansi = TextEditingController();
  TextEditingController _controllerTgl = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();

  @override
  void initState() {
    if (widget.profile != null) {
      _isFieldNameValid = true;
      _controllerName.text = widget.profile.name;
      _isFieldNIMValid = true;
      _controllerNIM.text = widget.profile.NIM;
      _isFieldKelasValid = true;
      _controllerKelas.text = widget.profile.Kelas;
      _isFieldInstansiValid = true;
      _controllerInstansi.text = widget.profile.Instansi;
      _isFieldTglValid = true;
      _controllerTgl.text = widget.profile.Tgl.toString();
      _isFieldEmailValid = true;
      _controllerEmail.text = widget.profile.email;
      _isFieldAgeValid = true;
      _controllerAge.text = widget.profile.age.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.profile == null ? "Formulir Data" : "Ubah Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldNIM(),
                _buildTextFieldKelas(),
                _buildTextFieldInstansi(),
                _buildTextFieldTgl(),
                _buildTextFieldEmail(),
                _buildTextFieldAge(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.profile == null
                          ? "Unggah".toUpperCase()
                          : "Perbarui Data".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldNameValid == null ||
                          _isFieldNIMValid == null ||
                          _isFieldKelasValid == null ||
                          _isFieldInstansiValid == null ||
                          _isFieldTglValid == null ||
                          _isFieldEmailValid == null ||
                          _isFieldAgeValid == null ||
                          !_isFieldNameValid ||
                          !_isFieldNIMValid ||
                          !_isFieldKelasValid ||
                          !_isFieldInstansiValid ||
                          !_isFieldTglValid ||
                          !_isFieldEmailValid ||
                          !_isFieldAgeValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Tolong isi bagian ini"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String name = _controllerName.text.toString();
                      String NIM = _controllerNIM.text.toString();
                      String Kelas = _controllerKelas.text.toString();
                      String Instansi = _controllerInstansi.text.toString();
                      int Tgl = int.parse(_controllerTgl.text.toString());
                      String email = _controllerEmail.text.toString();
                      int age = int.parse(_controllerAge.text.toString());
                      Profile profile =
                          Profile(name: name,NIM: NIM,Kelas : Kelas, Instansi: Instansi, Tgl : Tgl, email: email, age: age);
                      if (widget.profile == null) {
                        _apiService.createProfile(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Unggah Data Gagal"),
                            ));
                          }
                        });
                      } else {
                        profile.id = widget.profile.id;
                        _apiService.updateProfile(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Pembaharuan Data Gagal"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.lightGreenAccent,
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      maxLength: 25,
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'Nama',
          errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Silahkan Isi Nama",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldNIM() {
    return TextField(
      controller: _controllerNIM,
      keyboardType: TextInputType.text,
      maxLength: 11,
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'NIM',
        errorText: _isFieldNIMValid == null || _isFieldNIMValid
            ? null
            : "Silahkan Isi NIM",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNIMValid) {
          setState(() => _isFieldNIMValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldKelas() {
    return TextField(
      controller: _controllerKelas,
      keyboardType: TextInputType.text,
      maxLength: 7,
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'Kelas',
        errorText: _isFieldKelasValid == null || _isFieldKelasValid
            ? null
            : "Silahkan Isi Kelas",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldKelasValid) {
          setState(() => _isFieldKelasValid = isFieldValid);
        }
      },
    );
  }
  Widget _buildTextFieldInstansi() {
    return TextField(
      controller: _controllerInstansi,
      keyboardType: TextInputType.text,
      maxLength: 50,
      decoration: InputDecoration(
        suffix: Text('Bali'),
        hintText: 'Instansi',
        fillColor: Colors.orangeAccent[900],
        filled: true,
        errorText: _isFieldInstansiValid == null || _isFieldInstansiValid
            ? null
            : "Silahkan Isi Asal Instansi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldInstansiValid) {
          setState(() => _isFieldInstansiValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldTgl() {
    return TextField(
      controller: _controllerTgl,
      keyboardType: TextInputType.number,
      maxLength: 7,
      decoration: InputDecoration(
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'Tanggal Lahir',
        errorText: _isFieldTglValid == null || _isFieldTglValid
            ? null
            : "Silahkan Isi Tanggal Lahir Anda",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldTglValid) {
          setState(() => _isFieldTglValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      maxLength: 40,
      decoration: InputDecoration(
        suffix: Text('.com'),
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'Email',
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Silahkan Isi Email",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      maxLength: 2,
      decoration: InputDecoration(
        suffix: Text('Tahun'),
        fillColor: Colors.orangeAccent[900],
        filled: true,
        hintText: 'Umur',
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Silahkan Isi Umur",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
}
