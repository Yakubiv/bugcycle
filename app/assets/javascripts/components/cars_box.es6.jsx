class CarsBox extends React.Component {
  constructor(props){
    super(props)

    this.state = { cars: [] }
  }

  componentDidMount() {
    $.ajax({
      url: '/cars.json',
      method: 'get',
      success: (data) => {
        this.setState({cars: data})
      }

    })
  }

  render () {
    return (
      <div>
        <CarsList
          cars={this.state.cars} />
        <CarForm
          handleSubmit={this.handleSubmit.bind(this)} />
      </div>
    );
  }

  handleSubmit(car) {
    this.setState({cars: this.state.cars.concat(car)})
  }
}
