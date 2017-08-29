class SearchResultsList extends React.Component {
  render () {
    return (
      <div>
        <div>Search for: <strong>{this.props.term}</strong></div>
        <ul className={"dropdown-menu " + this.props.conditionClass}>
          <li className="dropdown-header">Results</li>
          {this.renderRsults()}

        </ul>
      </div>
    );
  }

  renderRsults() {
    return this.props.results.map((result) => {
      return (
        <SearchListItem key={result.id} result={result} />
      );
    });
  }
}
