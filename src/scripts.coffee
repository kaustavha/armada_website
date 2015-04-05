$(document).ready ->
  # cache the window object
  $window = $(window)
  $('section[data-type="background"]').each ->
    # declare the variable to affect the defined data-type
    $scroll = $(this)
    $(window).scroll ->
      # HTML5 proves useful for helping with creating JS functions!
      # also, negative value because we're scrolling upwards
      yPos = -($window.scrollTop() / $scroll.data('speed'))
      # background position
      coords = '50% ' + yPos + 'px'
      # move the background
      $scroll.css backgroundPosition: coords
      return
    # end window scroll
    return
  # end section function
  return
# close out script

signupForm = document.getElementById 'signup-form'
signupSuccess = document.getElementById 'signup-success'
signupError = document.getElementById 'signup-error'
signupBtn = document.getElementById 'signup-button'

onSignupComplete = (error) ->
  signupBtn.disabled = false
  if error
    signupError.innerHTML = 'Sorry. Could not signup.'
  else
    signupSuccess.innerHTML = 'Thanks for signing up!'
    # hide the form
    signupForm.style.display = 'none'
  return

signup = (formObj) ->
  # Store emails to firebase
  myFirebaseRef = new Firebase('https://blistering-fire-6663.firebaseio.com/')
  myFirebaseRef.push { email: formObj.email.value }, onSignupComplete
  signupBtn.disabled = true
  false

### Create HTML5 element for IE ###

document.createElement 'section'
