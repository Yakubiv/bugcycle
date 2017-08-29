class SearchListItem extends React.Component {
  render () {
    return (
      <li className="dropdown-item">
        <img src={this.props.result.image} className="dropdown-image"/>
        <a href={'/bicycles/' + this.props.result.id}>{this.props.result.name}</a>
      </li>
    );
  }
}
