class CarForm extends React.Component {
  render () {
    return (
      <form method="post" onSubmit={this._handleSubmit.bind(this)} id="new_car">
        <div className="form-group">
          <label htmlFor="bicycle_name">Name</label>
          <input className="form-control" required="required" ref={(input) => this.name = input}/>
        </div>
        <div className="form-group">
          <label htmlFor="bicycle_image">Image url. Could be changed to carrierwave later.</label>
          <input className="form-control" required="required" ref={(input) => this.image = input} />
        </div>
        <div className="form-group">
          <label htmlFor="bicycle_description">Description</label>
          <textarea rows="6" className="form-control" ref={(input) => this.description = input}></textarea>
        </div>
        <div className="form-group">
          <input type="submit" name="commit" value="Save Bike" className="btn btn-success"/>
        </div>
      </form>
    );
  }

  _clearForm() {
    form = document.getElementById('new_car')
    form.reset();
  }

  _handleSubmit(event) {
    event.preventDefault();

    let name = this.name.value
    let image = this.image.value
    let description = this.description.value

    $.ajax({
      url: '/cars',
      method: 'POST',
      data: { car: {name: name, image: image, description: description } },
      success: (data) => {
        this._clearForm();
        this.props.handleSubmit(data);
      }
    })
  }
}
