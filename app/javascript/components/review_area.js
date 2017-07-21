import React from 'react'
import { Rating } from 'semantic-ui-react'

class ReviewArea extends React.Component {


  getCSRFToken() {
    const metas = document.getElementsByTagName('meta');
    for (let i = 0; i < metas.length; i++) {
      const meta = metas[i];
      if (meta.getAttribute('name') === 'csrf-token') {
        return meta.getAttribute('content');
      }
    }

    return null;
  }

  handleRate = (e, { rating, maxRating, type }) => {
    fetch('/ratings/1', {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': this.getCSRFToken(),
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        score: rating,
        type: type,
      }),
      credentials: 'same-origin'
    })
  }

  render () {
    return(
      <div>
        <div id='average-rating' className='rating-catergory'>
          <p>{this.props.average_rating}&nbsp;Reviews</p>
          <Rating icon='star' defaultRating={this.props.average_star} maxRating={5} disabled={true} />
        </div>
        <div className='ui grid no margin'>
          <div className='rating-category eight wide column'>
            <p>Cultule</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.culture_star} maxRating={5} onRate={this.handleRate} type='culture' />
          </div>
          <div className='rating-category eight wide column'>
            <p>Environment</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.environment_star} maxRating={5} onRate={this.handleRate} type='environment' />
          </div>
          <div className='rating-category eight wide column'>
            <p>Cleanliness</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.cleanliness_star} maxRating={5} onRate={this.handleRate} type='cleanliness' />
          </div>
          <div className='rating-category eight wide column'>
            <p>Location</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.location_star} maxRating={5} onRate={this.handleRate} type='location' />
          </div>
          <div className='rating-category eight wide column'>
            <p>Learning</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.learning_star} maxRating={5} onRate={this.handleRate} type='learning' />
          </div>
          <div className='rating-category eight wide column'>
            <p>Management</p>
            <Rating className='move-left' icon='star' defaultRating={this.props.management_star} maxRating={5} onRate={this.handleRate} type='management' />
          </div>
        </div>
      </div>
    )
  }
}

export default ReviewArea
