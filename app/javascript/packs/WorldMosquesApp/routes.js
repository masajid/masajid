import React from 'react'
import {
  BrowserRouter as Router,
  Route,
} from 'react-router-dom'

import LandingPage from './components/landingPage'
import Account from './components/account'

const App = (props) => (
  <Router>
    <div>
      <Route exact path='/' component={LandingPage} />
      <Route exact path='/accounts/new' component={Account} />
    </div>
  </Router>
)

export default App
