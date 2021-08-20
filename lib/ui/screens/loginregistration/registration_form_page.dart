part of 'login_registration_screen.dart';

class RegistrationFormPage extends StatefulWidget {
  @override
  _RegistrationFormPageState createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var topSpaceHeight = MediaQuery.of(context).size.height / 6;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: topSpaceHeight,),
          _buildTitle(context),
          SizedBox(height: 20,),
          _buildEmailTextField(context),
          SizedBox(height: 10,),
          _buildPasswordTextField(context),
          SizedBox(height: 10,),
          _buildCredentialSwitch(context),
          SizedBox(height: 10,),
          _buildRegistrationButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AuthorizationTitleWidget(
        title: context.getString("registration"),
        fontSize: 26,
        fontWeight: FontWeight.w800
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return CustomTextFormWidget(
      controller: emailController,
      validator: Validator.emailValidator,
      label: context.getString("email"),
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return BlocProvider(
      create: (_) => VisibilityPasswordBloc(),
      child: CustomTextFormWidget(
        controller: passwordController,
        validator: Validator.passwordValidator,
        label: context.getString("password"),
        obscureText: true,
      ),
    );
  }

  Widget _buildCredentialSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.getString("login_registration"),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),

        Switch(
            value: true,
            onChanged: (value) {
              BlocProvider.of<LoginRegistrationBloc>(context).switchForm();
            }
        )
      ],
    );
  }

  Widget _buildRegistrationButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          var isLoading = state is LoadingState;

          return ButtonWidget(
            isLoading: isLoading,
            title: context.getString("registration_button"),
            onPressed: () {
              _onRegistrationButtonClick(context);
            },
          );
        });
  }

  void _onRegistrationButtonClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {

      var email = emailController.text;
      var password = passwordController.text;

      BlocProvider.of<AuthBloc>(context).onRegistrationClicked(email, password);
    }
  }
}
