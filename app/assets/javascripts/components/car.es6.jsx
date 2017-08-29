class Car extends React.Component {
  render () {
    return (
      <div>
        <div className="bicycle-box">
          <div className="bicycle-image" style={{backgroundImage: 'url(' + this.props.image + ')'}}></div>
          <div className="bicycle-content">
            <h4><a href={"/cars/" + this.props.id}>{this.props.name}</a></h4>
            <p>{this.props.description}</p>
          </div>
          </div>
      </div>
    );
  }
}
