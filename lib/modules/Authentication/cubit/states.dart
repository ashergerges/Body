abstract class AuthenticationStates{}

class LoginChangePasswordVisibilityState extends AuthenticationStates{}

class AuthenticationInitialState extends AuthenticationStates{}

class LoginLoadingState extends AuthenticationStates{}

class LoginSuccessState extends AuthenticationStates{}
class ProfileSuccessState extends AuthenticationStates{}
class BookUsersSuccessState extends AuthenticationStates{}
class FoodUsersSuccessState extends AuthenticationStates{}

class CancelBookingSuccessState extends AuthenticationStates{}
class SendResultSuccessState extends AuthenticationStates{}


class LoginErrorStateLog extends AuthenticationStates {
  final String error;
  LoginErrorStateLog(this.error);

}
class FoodErrorStateLog extends AuthenticationStates {
  final String error;
  FoodErrorStateLog(this.error);

}
class CancelBookingErrorState extends AuthenticationStates {
  final String error;
  CancelBookingErrorState(this.error);

}
class BookUsersErrorState extends AuthenticationStates {
  final String error;
  BookUsersErrorState(this.error);

}

class ProfileErrorState extends AuthenticationStates {
  final String error;
  ProfileErrorState(this.error);

}
class SignUPErrorState extends AuthenticationStates {
  final String error;
  SignUPErrorState(this.error);

}


class SignUpChangePasswordVisibilityState extends AuthenticationStates{}



class SignUploadingState extends AuthenticationStates{}

class SignUPSuccessState extends AuthenticationStates{}


class LoginErrorStateSign extends AuthenticationStates {
  final String error;
  LoginErrorStateSign(this.error);

}
class SignUPCreateUserErrorState extends AuthenticationStates {
  final String error;
  SignUPCreateUserErrorState(this.error);

}

///////////////////////////////
class SignUPCreateSuccessState extends AuthenticationStates{}
class TabChangeScreenState extends AuthenticationStates{}
class VideoPickedSuccessState extends AuthenticationStates{}
class VideoPickedErrorState extends AuthenticationStates{}
class SelectDatePerDayState extends AuthenticationStates{}
class AddSalaryState extends AuthenticationStates{}
class DeleteReviewSuccessState extends AuthenticationStates{}
class SendVideoSuccessState extends AuthenticationStates{}
class ClassificationUserSuccessState extends AuthenticationStates{}
class ClassificationUserErrorState extends AuthenticationStates
{
  final String error;
  ClassificationUserErrorState(this.error);

}
//////////////////////////////////////////////////////////////
class VideoSeekState extends AuthenticationStates{}
class UpdateSliderPositionState extends AuthenticationStates{}
class InitVideoPlayerState extends AuthenticationStates{}
class ChangePortraitToLandscapeState extends AuthenticationStates{}
class ShowControlVideoState extends AuthenticationStates{}
class KillVideoPlayerState extends AuthenticationStates{}
class IncreaseOrDecrease extends AuthenticationStates{}
class PauseAndPlayVideo extends AuthenticationStates{}
class GetHotelsSuccessState extends AuthenticationStates{}
class SearchAboutGameState extends AuthenticationStates{}
//////////////////////////////////////////////////////////////
class PostImagePickedSuccessState extends AuthenticationStates{}
class PostImagePickedErrorState extends AuthenticationStates{}
class CheekAuthenticationState extends AuthenticationStates{}
/////////////////////////////PostScreen///////////////////////////////////////////
class SignUPCreateUserSuccessState extends AuthenticationStates{}
class PickedImageLoadingState extends AuthenticationStates{}
class RemovePostImageState extends AuthenticationStates{}
//////////////////////////////////////////////////////////////////////////
