class SearchBox extends React.Component {
  constructor(props){
    super(props)
    this.state = { term: '', results: [], conditionClass: 'close' }
  }

  search(term) {
    this.setState({term})

    $.ajax({
      url: `/autocompletes.json/?term=${term}`,
      method: 'get',
      success: (data) => {
        this.setState({
          results: data
        })
      }
    });
  }

  render () {
    return (
      <div>
        <SearchBar
          term={this.state.term}
          onSearchTermSearch={ (term) => {this.search(term)} }
        />

        {this.renderSearchResults()}
      </div>
    );
  }

  renderSearchResults() {
    if (this.state.results.length === 0 || this.state.term.length === 0) {
      return;
    }

    return (
      <SearchResultsList
        conditionClass='open'
        term={this.state.term}
        results={this.state.results} />
    );
  }
}
