class SearchBar extends React.Component {
  render () {
    return (
      <form className="search-form" action="/" method="get">
        <input name="utf8" type="hidden" value="✓"/>
        <div className="search-field">
          <input
            onChange={(event) => {this.props.onSearchTermSearch(event.target.value)}}
            value={this.props.value}
            type="search"
            name="search"
            id="search"
            autoComplete="off"
            placeholder="Search for bicycles"
            className="search-input"
            />
        </div>
      </form>
    );
  }
}
