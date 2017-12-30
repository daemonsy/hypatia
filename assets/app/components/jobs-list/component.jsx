import React from 'react';

class JobsList extends React.Component {
  render() {
    if( this.props.jobsList.loading) {
      return <div>Loading...</div>
    }

    const { jobs } = this.props.jobsList;

    return (
      <div className="columns">
        <div className="column is-two-thirds">
          <div className="panel">
            <p className="panel-heading">Jobs</p>
            <div className="panel-block">
              <p className="control has-icons-left">
                <input className="input is-small" type="text" placeholder="search"/>
                <span className="icon is-small is-left">
                  <i className="fa fa-search"></i>
                </span>
              </p>
            </div>
            <p className="panel-tabs">
              <a className="is-active">all</a>
              <a>public</a>
              <a>private</a>
              <a>sources</a>
              <a>forks</a>
            </p>
            { jobs.map(job => {
              return (
                <a key={job.id} className="panel-block">
                  { job.title }
                </a>
              )
            })}
          </div>
        </div>
      </div>
    )
  }
}

export default JobsList;
