import { graphql } from "react-apollo";
import gql from "graphql-tag";
import JobsList from "./component";

const JobsListQuery = gql`
  query JobsListQuery {
    jobs: allJobs {
      id
      title
    }
  }
`;

export default graphql(JobsListQuery, { name: "jobsList" })(JobsList)
