import React from 'react'
import { Rating } from 'semantic-ui-react'

class StarRating extends React.Component {
  render () {
    return <Rating className={this.props.className} icon='star' defaultRating={3} maxRating={5} />;
  }
}

export default StarRating
