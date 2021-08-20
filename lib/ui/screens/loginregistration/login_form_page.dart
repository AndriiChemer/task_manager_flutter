part of 'login_registration_screen.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
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
          _buildSignInButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AuthorizationTitleWidget(
        title: context.getString("sing_in"),
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
            value: false,
            onChanged: (value) {
              BlocProvider.of<LoginRegistrationBloc>(context).switchForm();
            }
        )
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          var isLoading = state is LoadingState;

          return ButtonWidget(
            isLoading: isLoading,
            title: context.getString("login_button"),
            onPressed: () {
              _onSingInButtonClick(context);
            },
          );
        });
  }

  void _onSingInButtonClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {

      var email = emailController.text;
      var password = passwordController.text;

      BlocProvider.of<AuthBloc>(context).onSignInClicked(email, password);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
