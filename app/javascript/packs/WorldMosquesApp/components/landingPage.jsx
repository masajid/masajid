import React from 'react'

import Account from './landingPage/account';
import Slider from './landingPage/slider';

import imageService1 from '../assets/images/service-icon-1.png'
import imageService2 from '../assets/images/service-icon-2.png'
import imageService3 from '../assets/images/service-icon-3.png'

import imageScreen1 from '../assets/images/screen-1.jpg'
import imageScreen2 from '../assets/images/screen-2.jpg'
import imageScreen3 from '../assets/images/screen-3.jpg'
import imageScreen4 from '../assets/images/screen-4.jpg'
import imageScreen7 from '../assets/images/screen-7.jpg'

import imagePortfolio1 from '../assets/images/portfolio-icon-1.png'
import imagePortfolio2 from '../assets/images/portfolio-icon-2.png'
import imagePortfolio3 from '../assets/images/portfolio-icon-3.png'
import imagePortfolio4 from '../assets/images/portfolio-icon-4.png'
import imagePortfolio5 from '../assets/images/portfolio-icon-5.png'
import imagePortfolio6 from '../assets/images/portfolio-icon-6.png'

import imageTeam1 from '../assets/images/team-section-1.png'
import imageTeam2 from '../assets/images/team-section-2.png'
import imageTeam3 from '../assets/images/team-section-4.png'
import imageTeam4 from '../assets/images/team-section-4.png'

import imageAvatar1 from '../assets/images/avatar-small-1.png'
import imageAvatar2 from '../assets/images/avatar-small-2.png'
import imageAvatar3 from '../assets/images/avatar-small-3.png'
import imageAvatar4 from '../assets/images/avatar-small-4.png'
import imageAvatar5 from '../assets/images/avatar-small-5.png'
import imageAvatar6 from '../assets/images/avatar-small-6.png'

import imageThemeforest from '../assets/images/themeforest.gif'
import imageCoadcanyon from '../assets/images/coadcanyon.gif'
import imageGraphicriver from '../assets/images/graphicriver.gif'
import imageDocean from '../assets/images/docean.gif'
import imageAudiojungle from '../assets/images/audiojungle.gif'
import imageActividen from '../assets/images/actividen.gif'
import imagePhotodone from '../assets/images/photodone.gif'
import imageVidegub from '../assets/images/videgub.gif'

import imageSmall1 from '../assets/images/small1.jpg'
import imageSmall2 from '../assets/images/small2.jpg'
import imageSmall3 from '../assets/images/small3.jpg'

import imageLocationArrow from '../assets/images/location-arrow.png'
import imagePhoneArrow from '../assets/images/phone-arrow.png'
import imageMailArrow from '../assets/images/mail-arrow.png'

class LandingPage extends React.Component {
  componentDidMount () {
    $(".carousel-inner .item:first-child").addClass("active");
    /* Mobile menu click then remove
    ==========================*/
    $(".mainmenu-area #mainmenu li a").on("click", function () {
      $(".navbar-collapse").removeClass("in");
    });
    /*WoW js Active
    =================*/
    new WOW().init({
      mobile: true,
    });
    /* Scroll to top
    ===================*/
    $.scrollUp({
      scrollText: '<i class="fa fa-angle-up"></i>',
      easingType: 'linear',
      scrollSpeed: 900,
      animation: 'fade'
    });
    /* testimonials Slider Active
    =============================*/
    $('.testimonials').owlCarousel({
      loop: true,
      margin: 0,
      responsiveClass: true,
      nav: true,
      autoplay: true,
      autoplayTimeout: 4000,
      smartSpeed: 1000,
      navText: ['<i class="ti-arrow-left"></i>', '<i class="ti-arrow-right" ></i>'],
      items: 1
    });
    /* clients Slider Active
    =============================*/
    $('.clients').owlCarousel({
      loop: true,
      margin: 30,
      responsiveClass: true,
      nav: true,
      autoplay: true,
      autoplayTimeout: 4000,
      smartSpeed: 1000,
      navText: ['<i class="ti-arrow-left"></i>', '<i class="ti-arrow-right" ></i>'],
      responsive: {
        0: {
          items: 3,
        },
        600: {
          items: 4
        },
        1000: {
          items: 6
        }
      }
    });
    /*--------------------
       MAGNIFIC POPUP JS
       ----------------------*/
    var magnifPopup = function () {
      $('.work-popup').magnificPopup({
        type: 'image',
        removalDelay: 300,
        mainClass: 'mfp-with-zoom',
        gallery: {
          enabled: true
        },
        zoom: {
          enabled: true, // By default it's false, so don't forget to enable it

          duration: 300, // duration of the effect, in milliseconds
          easing: 'ease-in-out', // CSS transition easing function

          // The "opener" function should return the element from which popup will be zoomed in
          // and to which popup will be scaled down
          // By defailt it looks for an image tag:
          opener: function (openerElement) {
            // openerElement is the element on which popup was initialized, in this case its <a> tag
            // you don't need to add "opener" option if this code matches your needs, it's defailt one.
            return openerElement.is('img') ? openerElement : openerElement.find('img');
          }
        }
      });
    };
    // Call the functions
    magnifPopup();

    // Background Parallax
    $('.header-area').parallax("50%", -0.4);
    $('.testimonial-area').parallax("10%", -0.2);

    $('#accordion .panel-title a').prepend('<span></span>');

    // Function to animate slider captions
    function doAnimations(elems) {
      // Cache the animationend event in a variable
      var animEndEv = 'webkitAnimationEnd animationend';

      elems.each(function () {
        var $this = $(this),
          $animationType = $this.data('animation');
        $this.addClass($animationType).one(animEndEv, function () {
          $this.removeClass($animationType);
        });
      });
    }

    // Variables on page load
    var $myCarousel = $('.caption-slider'),
      $firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");

    // Initialize carousel
    $myCarousel.carousel();

    // Animate captions in first slide on page load
    doAnimations($firstAnimatingElems);

    // Pause carousel
    $myCarousel.carousel('pause');

    // Other slides to be animated on carousel slide event
    $myCarousel.on('slide.bs.carousel', function (e) {
      var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
      doAnimations($animatingElems);
    });

    // Select all links with hashes
    $('.mainmenu-area a[href*="#"]')
    // Remove links that don't actually link to anything
      .not('[href="#"]')
      .not('[href="#0"]')
      .click(function (event) {
        // On-page links
        if (
          location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
          location.hostname == this.hostname
        ) {
          // Figure out element to scroll to
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
          // Does a scroll target exist?
          if (target.length) {
            // Only prevent default if animation is actually gonna happen
            event.preventDefault();
            $('html, body').animate({
              scrollTop: target.offset().top
            }, 1000, function () {
              // Callback after animation
              // Must change focus!
              var $target = $(target);
              $target.focus();
              if ($target.is(":focus")) { // Checking if the target was focused
                return false;
              } else {
                $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                $target.focus(); // Set focus again
              };
            });
          }
        }
      });

    /* Preloader Js
    ===================*/
    $(window).on("load", function () {
      $('.preloader').fadeOut(500);
    });
  }

  render() {
    return(
      <div>
        <div className="preloader">
          <div className="sk-folding-cube">
            <div className="sk-cube1 sk-cube"></div>
            <div className="sk-cube2 sk-cube"></div>
            <div className="sk-cube4 sk-cube"></div>
            <div className="sk-cube3 sk-cube"></div>
          </div>
        </div>

        <div className="mainmenu-area" data-spy="affix" data-offset-top="100">
          <div className="container">
            <div className="navbar-header">
              <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#primary-menu">
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
              </button>
              <a href="#" className="navbar-brand logo">
                <h2>The Open Masjid</h2>
              </a>
            </div>
            <nav className="collapse navbar-collapse" id="primary-menu">
              <ul className="nav navbar-nav navbar-right">
                <li className="active"><a href="#home-page">Home</a></li>
                <li><a href="#service-page">Service</a></li>
                <li><a href="#feature-page">Features</a></li>
                <li><a href="#account-page">Create Account</a></li>
                <li><a href="#team-page">Team</a></li>
                <li><a href="#faq-page">FAQ</a></li>
                <li><a href="#blog-page">Blog</a></li>
                <li><a href="#contact-page">Contact</a></li>
              </ul>
            </nav>
          </div>
        </div>

        <Slider />

        <section className="gray-bg section-padding" id="service-page">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imageService1} alt="" />
                  </div>
                  <h4>EASY TO USE</h4>
                  <p>Lorem ipsum dolor sit amt, consectet adop adipisicing elit, sed do eiusmod tepo raraincididunt ugt
                    labore.</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imageService2} alt="" />
                  </div>
                  <h4>AWESOEM DESIGN</h4>
                  <p>Lorem ipsum dolor sit amt, consectet adop adipisicing elit, sed do eiusmod tepo raraincididunt ugt
                    labore.</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imageService3} alt="" />
                  </div>
                  <h4>EASY TO CUSTOMAIZE</h4>
                  <p>Lorem ipsum dolor sit amt, consectet adop adipisicing elit, sed do eiusmod tepo raraincididunt ugt
                    labore.</p>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="angle-bg sky-bg section-padding">
          <div className="container">
            <div className="row">
              <div className="col-xs-12">
                <div id="caption_slide" className="carousel slide caption-slider" data-ride="carousel">
                  <div className="carousel-inner" role="listbox">
                    <div className="item active row">
                      <div className="v-center">
                        <div className="col-xs-12 col-md-6">
                          <div className="caption-title" data-animation="animated fadeInUp">
                            <h2>Easy to build</h2>
                          </div>
                          <div className="caption-desc" data-animation="animated fadeInUp">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                              labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                              laboris nisi ut aliquip ex ea commodo consequat. Duis aute</p>
                          </div>
                          <div className="caption-button" data-animation="animated fadeInUp">
                            <a href="#" className="button">Read more</a>
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo one" data-animation="animated fadeInRight">
                            <img src={imageScreen1} alt="" />
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo two" data-animation="animated fadeInRight">
                            <img src={imageScreen2} alt="" />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div className="item row">
                      <div className="v-center">
                        <div className="col-xs-12 col-md-6">
                          <div className="caption-title" data-animation="animated fadeInUp">
                            <h2>Easy to use</h2>
                          </div>
                          <div className="caption-desc" data-animation="animated fadeInUp">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                              labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                              laboris nisi ut aliquip ex ea commodo consequat. Duis aute</p>
                          </div>
                          <div className="caption-button" data-animation="animated fadeInUp">
                            <a href="#" className="button">Read more</a>
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo one" data-animation="animated fadeInRight">
                            <img src={imageScreen3} alt="" />
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo two" data-animation="animated fadeInRight">
                            <img src={imageScreen4} alt="" />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div className="item row">
                      <div className="v-center">
                        <div className="col-xs-12 col-md-6">
                          <div className="caption-title" data-animation="animated fadeInUp">
                            <h2>Easy to customize</h2>
                          </div>
                          <div className="caption-desc" data-animation="animated fadeInUp">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                              labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                              laboris nisi ut aliquip ex ea commodo consequat. Duis aute</p>
                          </div>
                          <div className="caption-button" data-animation="animated fadeInUp">
                            <a href="#" className="button">Read more</a>
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo one" data-animation="animated fadeInRight">
                            <img src={imageScreen7} alt="" />
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo two" data-animation="animated fadeInRight">
                            <img src={imageScreen2} alt="" />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div className="item row">
                      <div className="v-center">
                        <div className="col-xs-12 col-md-6">
                          <div className="caption-title" data-animation="animated fadeInUp">
                            <h2>Awesome design</h2>
                          </div>
                          <div className="caption-desc" data-animation="animated fadeInUp">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                              labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                              laboris nisi ut aliquip ex ea commodo consequat. Duis aute</p>
                          </div>
                          <div className="caption-button" data-animation="animated fadeInUp">
                            <a href="#" className="button">Read more</a>
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo one" data-animation="animated fadeInRight">
                            <img src={imageScreen3} alt="" />
                          </div>
                        </div>
                        <div className="col-xs-6 col-md-3">
                          <div className="caption-photo two" data-animation="animated fadeInRight">
                            <img src={imageScreen4} alt="" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <ol className="carousel-indicators caption-indector">
                    <li data-target="#caption_slide" data-slide-to="0" className="active">
                      <strong>Lorem ipsum </strong>consectetur adipisicing elit.
                    </li>
                    <li data-target="#caption_slide" data-slide-to="1">
                      <strong>Lorem ipsum </strong>consectetur adipisicing elit.
                    </li>
                    <li data-target="#caption_slide" data-slide-to="2">
                      <strong>Lorem ipsum </strong>consectetur adipisicing elit.
                    </li>
                    <li data-target="#caption_slide" data-slide-to="3">
                      <strong>Lorem ipsum </strong>consectetur adipisicing elit.
                    </li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="gray-bg section-padding" id="feature-page">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div className="page-title">
                  <h2>SPECIAL FEATURES</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere harum
                    fugiat!</p>
                </div>
              </div>
            </div>
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio1} alt="" />
                  </div>
                  <h3>Creative Design</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio2} alt="" />
                  </div>
                  <h3>Unlimited Features</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio3} alt="" />
                  </div>
                  <h3>Full Free Chat</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio4} alt="" />
                  </div>
                  <h3>Retina ready</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio5} alt="" />
                  </div>
                  <h3>High Resolution</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-4">
                <div className="box">
                  <div className="box-icon">
                    <img src={imagePortfolio6} alt="" />
                  </div>
                  <h3>Clean Codes</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque quas nulla est adipisci,</p>
                </div>
              </div>
            </div>
          </div>
        </section>

        <Account />

        <section className="section-padding gray-bg" id="team-page">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div className="page-title">
                  <h2>Special team</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere harum
                    fugiat!</p>
                </div>
              </div>
            </div>
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-md-3">
                <div className="single-team">
                  <div className="team-photo">
                    <img src={imageTeam1} alt="" />
                  </div>
                  <h4>JEMY SEDONCE</h4>
                  <h6>Co. Founder</h6>
                  <ul className="social-menu">
                    <li><a href="#"><i className="ti-facebook"></i></a></li>
                    <li><a href="#"><i className="ti-twitter"></i></a></li>
                    <li><a href="#"><i className="ti-linkedin"></i></a></li>
                    <li><a href="#"><i className="ti-pinterest"></i></a></li>
                  </ul>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-3">
                <div className="single-team">
                  <div className="team-photo">
                    <img src={imageTeam2} alt="" />
                  </div>
                  <h4>DEBORAH BROWN</h4>
                  <h6>UX Designer</h6>
                  <ul className="social-menu">
                    <li><a href="#"><i className="ti-facebook"></i></a></li>
                    <li><a href="#"><i className="ti-twitter"></i></a></li>
                    <li><a href="#"><i className="ti-linkedin"></i></a></li>
                    <li><a href="#"><i className="ti-pinterest"></i></a></li>
                  </ul>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-3">
                <div className="single-team">
                  <div className="team-photo">
                    <img src={imageTeam3} alt="" />
                  </div>
                  <h4>HARRY BANKS</h4>
                  <h6>Founder</h6>
                  <ul className="social-menu">
                    <li><a href="#"><i className="ti-facebook"></i></a></li>
                    <li><a href="#"><i className="ti-twitter"></i></a></li>
                    <li><a href="#"><i className="ti-linkedin"></i></a></li>
                    <li><a href="#"><i className="ti-pinterest"></i></a></li>
                  </ul>
                </div>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-3">
                <div className="single-team">
                  <div className="team-photo">
                    <img src={imageTeam4} alt="" />
                  </div>
                  <h4>VICTORIA CLARK</h4>
                  <h6>Creative Director</h6>
                  <ul className="social-menu">
                    <li><a href="#"><i className="ti-facebook"></i></a></li>
                    <li><a href="#"><i className="ti-twitter"></i></a></li>
                    <li><a href="#"><i className="ti-linkedin"></i></a></li>
                    <li><a href="#"><i className="ti-pinterest"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="testimonial-area section-padding gray-bg overlay">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div className="page-title">
                  <h2>Client says</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere harum
                    fugiat!</p>
                </div>
              </div>
            </div>
            <div className="row">
              <div className="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <div className="testimonials">
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar1} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar2} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar3} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar4} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar5} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                  <div className="testimonial">
                    <div className="testimonial-photo">
                      <img src={imageAvatar6} alt="" />
                    </div>
                    <h3>AR Rahman</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel vero dolore officiis, velit id libero
                      illum harum hic magni, quae repellendus adipisci possimus saepe nostrum doloribus repudiandae
                      asperiores commodi voluptate.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="gray-bg section-padding" id="faq-page">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                <div className="page-title">
                  <h2>Frequently Asked Questions</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere harum
                    fugiat!</p>
                </div>
              </div>
            </div>
            <div className="row">
              <div className="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <div className="panel-group" id="accordion">
                  <div className="panel">
                    <h4 className="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true">Sedeiusmod
                        tempor inccsetetur aliquatraiy?</a>
                    </h4>
                    <div id="collapse1" className="panel-collapse collapse in">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodas temporo incididunt ut
                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrd exercitation ullamco laboris
                        nisi ut aliquip ex comodo consequat. Duis aute dolor in reprehenderit.</p>
                    </div>
                  </div>
                  <div className="panel">
                    <h4 className="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Tempor inccsetetur
                        aliquatraiy?</a>
                    </h4>
                    <div id="collapse2" className="panel-collapse collapse">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodas temporo incididunt ut
                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrd exercitation ullamco laboris
                        nisi ut aliquip ex comodo consequat. Duis aute dolor in reprehenderit.</p>
                    </div>
                  </div>
                  <div className="panel">
                    <h4 className="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Lorem ipsum dolor amet,
                        consectetur adipisicing ?</a>
                    </h4>
                    <div id="collapse3" className="panel-collapse collapse">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodas temporo incididunt ut
                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrd exercitation ullamco laboris
                        nisi ut aliquip ex comodo consequat. Duis aute dolor in reprehenderit.</p>
                    </div>
                  </div>
                  <div className="panel">
                    <h4 className="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Lorem ipsum dolor amet,
                        consectetur adipisicing ?</a>
                    </h4>
                    <div id="collapse4" className="panel-collapse collapse">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodas temporo incididunt ut
                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrd exercitation ullamco laboris
                        nisi ut aliquip ex comodo consequat. Duis aute dolor in reprehenderit.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="section-padding overlay client-area overlay" id="client-page">
          <div className="container">
            <div className="row text-center">
              <div className="col-xs-12">
                <div className="clients">
                  <div className="item">
                    <img src={imageThemeforest} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageCoadcanyon} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageGraphicriver} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageDocean} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageAudiojungle} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageActividen} alt="" />
                  </div>
                  <div className="item">
                    <img src={imagePhotodone} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageVidegub} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageThemeforest} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageCoadcanyon} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageGraphicriver} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageDocean} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageAudiojungle} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageActividen} alt="" />
                  </div>
                  <div className="item">
                    <img src={imagePhotodone} alt="" />
                  </div>
                  <div className="item">
                    <img src={imageVidegub} alt="" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="section-padding gray-bg" id="blog-page">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-4">
                <div className="single-blog">
                  <div className="blog-photo">
                    <img src={imageSmall1} alt="" />
                  </div>
                  <div className="blog-content">
                    <h3><a href="#">Beautiful Place for your Great Journey</a></h3>
                    <ul className="blog-meta">
                      <li><span className="ti-user"></span> <a href="#">Admin</a></li>
                      <li><span className="ti-calendar"></span> <a href="#">Feb 01, 2017</a></li>
                    </ul>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit nemo eaque expedita aliquid dolorem
                      repellat perferendis, facilis aut fugit, impedit.</p>
                  </div>
                </div>
              </div>
              <div className="col-xs-12 col-sm-4">
                <div className="single-blog">
                  <div className="blog-photo">
                    <img src={imageSmall2} alt="" />
                  </div>
                  <div className="blog-content">
                    <h3><a href="#">Beautiful Place for your Great Journey</a></h3>
                    <ul className="blog-meta">
                      <li><span className="ti-user"></span> <a href="#">Admin</a></li>
                      <li><span className="ti-calendar"></span> <a href="#">Feb 01, 2017</a></li>
                    </ul>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit nemo eaque expedita aliquid dolorem
                      repellat perferendis, facilis aut fugit, impedit.</p>
                  </div>
                </div>
              </div>
              <div className="col-xs-12 col-sm-4">
                <div className="single-blog">
                  <div className="blog-photo">
                    <img src={imageSmall3} alt="" />
                  </div>
                  <div className="blog-content">
                    <h3><a href="#">Beautiful Place for your Great Journey</a></h3>
                    <ul className="blog-meta">
                      <li><span className="ti-user"></span> <a href="#">Admin</a></li>
                      <li><span className="ti-calendar"></span> <a href="#">Feb 01, 2017</a></li>
                    </ul>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit nemo eaque expedita aliquid dolorem
                      repellat perferendis, facilis aut fugit, impedit.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <footer className="footer-area relative sky-bg" id="contact-page">
          <div className="absolute footer-bg"></div>
          <div className="footer-top">
            <div className="container">
              <div className="row">
                <div className="col-xs-12 col-sm-6 col-sm-offset-3 text-center">
                  <div className="page-title">
                    <h2>Contact with us</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit voluptates, temporibus at, facere
                      harum fugiat!</p>
                  </div>
                </div>
              </div>
              <div className="row">
                <div className="col-xs-12 col-md-4">
                  <address className="side-icon-boxes">
                    <div className="side-icon-box">
                      <div className="side-icon">
                        <img src={imageLocationArrow} alt="" />
                      </div>
                      <p><strong>Address: </strong> Box 564, Disneyland <br/>USA</p>
                    </div>
                    <div className="side-icon-box">
                      <div className="side-icon">
                        <img src={imagePhoneArrow} alt="" />
                      </div>
                      <p><strong>Telephone: </strong>
                        <a href="callto:8801812726495">+8801812726495</a> <br/>
                        <a href="callto:8801687420471">+8801687420471</a>
                      </p>
                    </div>
                    <div className="side-icon-box">
                      <div className="side-icon">
                        <img src={imageMailArrow} alt="" />
                      </div>
                      <p><strong>E-mail: </strong>
                        <a href="mailto:youremail@example.com">youremail@example.com</a> <br/>
                        <a href="mailto:youremail@example.com">example@mail.com</a>
                      </p>
                    </div>
                  </address>
                </div>
                <div className="col-xs-12 col-md-8">
                  <form action="process.php" id="contact-form" method="post" className="contact-form">
                    <div className="form-double">
                      <input type="text" id="form-name" name="form-name" placeholder="Your name" className="form-control" required="required" />
                      <input type="email" id="form-email" name="form-email" className="form-control" placeholder="E-mail address" required="required" />
                    </div>
                    <input type="text" id="form-subject" name="form-subject" className="form-control" placeholder="Message topic" />
                    <textarea name="message" id="form-message" name="form-message" rows="5" className="form-control" placeholder="Your message" required="required"></textarea>
                    <button type="sibmit" className="button">Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div className="footer-middle">
            <div className="container">
              <div className="row">
                <div className="col-xs-12 col-sm-6 pull-right">
                  <ul className="social-menu text-right x-left">
                    <li><a href="#"><i className="ti-facebook"></i></a></li>
                    <li><a href="#"><i className="ti-twitter"></i></a></li>
                    <li><a href="#"><i className="ti-google"></i></a></li>
                    <li><a href="#"><i className="ti-linkedin"></i></a></li>
                    <li><a href="#"><i className="ti-github"></i></a></li>
                  </ul>
                </div>
                <div className="col-xs-12 col-sm-6">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id corrupti architecto consequuntur, laborum
                    quaerat sed nemo temporibus unde, beatae vel.</p>
                </div>
              </div>
            </div>
          </div>
          <div className="footer-bottom">
            <div className="container">
              <div className="row">
                <div className="col-xs-12 text-center">
                  <p>&copy;Copyright 2018 All right resurved. This template is made with <i className="ti-heart"
                                                                                            aria-hidden="true"></i> by <a
                    href="https://colorlib.com">Colorlib</a></p>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
    )
  }
}

export default LandingPage
