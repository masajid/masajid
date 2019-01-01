import React from 'react'
import { Link } from 'react-router-dom'

class LandingPage extends React.Component {
  render() {
    return(
      <React.Fragment>
        <nav className='navbar navbar-expand-lg navbar-light bg-light rounded'>
          <a className='navbar-brand' href='#'>The Open Masjid</a>
          <button className='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarsExample09' aria-controls='navbarsExample09' aria-expanded='false' aria-label='Toggle navigation'>
            <span className='navbar-toggler-icon'></span>
          </button>

          <div className='collapse navbar-collapse' id='navbarsExample09'>
            <ul className='navbar-nav ml-auto'>
              <li className='nav-item'>
                <Link className='nav-link' to='/accounts/new'>Create Masjid Account</Link>
              </li>
              <li className='nav-item'>
                <a className='nav-link' href='/users/sign_in'>Sign in</a>
              </li>
            </ul>
          </div>
        </nav>

        <main role='main'>
          <div className='jumbotron'>
            <div className='col-sm-8 mx-auto'>
              <h1>Your Masjid online</h1>
              <p>Here you can create a website for your masjid, in order to add articles, events, posts ... etc.</p>
              <p>
                <Link className='btn btn-primary' to='/accounts/new' role='button'>Create Masjid Account »</Link>
              </p>
            </div>
          </div>
        </main>

        <div className='container'>
          <div className='row'>
            <div className='col-md-4'>
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
              <p><a className='btn btn-secondary' href='#' role='button'>View details »</a></p>
            </div>
            <div className='col-md-4'>
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
              <p><a className='btn btn-secondary' href='#' role='button'>View details »</a></p>
            </div>
            <div className='col-md-4'>
              <h2>Heading</h2>
              <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
                fermentum massa justo sit amet risus.</p>
              <p><a className='btn btn-secondary' href='#' role='button'>View details »</a></p>
            </div>
          </div>

          <hr />

          <footer className='container'>
            <p>© The Open Masjid 2019</p>
          </footer>
        </div>
      </React.Fragment>
    )
  }
}

export default LandingPage
