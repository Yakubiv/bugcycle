class CarsList extends React.Component {
  render () {
    return (
      <div className="cars">
        <h4 className="page-header">Cars {this.props.cars.length}</h4>
        <hr/>
        {this._listCars()}
      </div>
    );
  }

  _listCars(){
    return this.props.cars.map((car) => {
      return (
        <Car
          key={car.id}
          id={car.id}
          name={car.name}
          image={car.image}
          description={car.description} />
      );
    });
  }
}
