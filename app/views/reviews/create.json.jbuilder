if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {booking: Booking.where(user_id: current_user.id, friend_id:params[:id])[0], review: Review.new})
  json.inserted_item render(partial: "friends/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {booking: Booking.where(user_id: current_user.id, friend_id:params[:id])[0], review: @review})
end
