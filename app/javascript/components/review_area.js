import React from 'react'
import { Rating } from 'semantic-ui-react'

class ReviewArea extends React.Component {
  render () {
    return(
      <div>
        <div id='average-rating' className='rating-catergory'>
          <p>{this.props.average_rating}&nbsp;Reviews</p>
          <Rating icon='star' defaultRating={this.props.average_star} maxRating={5} disabled='true' />
        </div>
        <div className='ui grid no margin'>
          <div className='rating-category eight wide column'>
            <p>Cultule</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.culture_star} maxRating={5} />
          </div>
          <div className='rating-category eight wide column'>
            <p>Environment</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.environment_star} maxRating={5} />
          </div>
          <div className='rating-category eight wide column'>
            <p>Cleanliness</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.cleanliness_star} maxRating={5} />
          </div>
          <div className='rating-category eight wide column'>
            <p>Location</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.location_star} maxRating={5} />
          </div>
          <div className='rating-category eight wide column'>
            <p>Learning</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.learning_star} maxRating={5} />
          </div>
          <div className='rating-category eight wide column'>
            <p>Management</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.management_star} maxRating={5} />
          </div>
        </div>
      </div>
    )
  }
}

export default ReviewArea
