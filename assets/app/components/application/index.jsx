import React from 'react';

import JobsList from 'components/jobs-list';

class Application extends React.Component {
  render() {
    return (
      <React.Fragment>
        <nav className="navbar" role="navigation" aria-label="main navigation">
          <div className="container">
            <div className="navbar-brand">
              <a className="navbar-item" href="#">
                Hypatia
              </a>
              <button className="button navbar-burger">
                <span></span>
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </nav>
        <div className="section">
          <div className="container">
            <JobsList />
          </div>
        </div>
      </React.Fragment>
    )

  }
}

export default Application;
