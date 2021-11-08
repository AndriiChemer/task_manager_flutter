part of 'login_registration_screen.dart';

class LoginFormPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final topSpaceHeight = MediaQuery.of(context).size.height / 6;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();

    final onLoginClickCallback = useCallback(() {
      if (_formKey.currentState!.validate()) {
        var email = emailController.text;
        var password = passwordController.text;

        BlocProvider.of<AuthBloc>(context).onSignInClicked(email, password);
      }
    }, [_formKey]);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: topSpaceHeight,),
          _buildTitle(context),
          SizedBox(height: 20,),
          _buildEmailTextField(context, emailController),
          SizedBox(height: 10,),
          _buildPasswordTextField(context, passwordController),
          SizedBox(height: 10,),
          _buildCredentialSwitch(context),
          SizedBox(height: 10,),
          _buildSignInButton(context, onLoginClickCallback),
        ],
      ),
    );

  }

  Widget _buildTitle(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        context.showPositiveMessage("itest@itest.com\titest123");
      },
      child: AuthorizationTitleWidget(
          title: context.getString("sing_in"),
          fontSize: 26,
          fontWeight: FontWeight.w800
      ),
    );
  }

  Widget _buildEmailTextField(BuildContext context, TextEditingController emailController) {
    return CustomTextFormWidget(
      controller: emailController,
      validator: Validator.emailValidator,
      label: context.getString("email"),
    );
  }

  Widget _buildPasswordTextField(BuildContext context, TextEditingController passwordController) {
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
            BlocProvider.of<CredentialTypeCubit>(context).switchCredentialType();
          }
        )
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context, Function() onSubmit) {
    return LogoutButton(
      context.getString("login_button"),
      () => onSubmit()
    );
  }
}


