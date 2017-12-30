import React from "react";
import ReactDOM from "react-dom";
import Application from "./components/application";
import { ApolloProvider } from 'react-apollo'
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

import './styles.scss';

const httpLink = new HttpLink({ uri: 'http://localhost:4000/api/graphql' })
const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <Application />
  </ApolloProvider>
  , document.getElementById('app')
);


