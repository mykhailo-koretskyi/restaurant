require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "happy path" do
    assert Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 10:00:00", :end_time => "2015-01-30 12:00:00").id
  end

test "overlapping of reservations" do
  Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 10:00:00", :end_time => "2015-01-30 12:00:00")
  assert_not Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 10:00:00", :end_time => "2015-01-30 12:00:00").id
end

test "overlapping of reservations1" do
  Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 10:00:00", :end_time => "2015-01-30 12:00:00")
  assert_not Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 09:00:00", :end_time => "2015-01-30 11:00:00").id
end

test "overlapping of reservations2" do
  Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 10:00:00", :end_time => "2015-01-30 12:00:00")
  assert_not Reservation.create(:table_id => 1, :user_id => 1, :start_time => "2015-01-30 11:00:00", :end_time => "2015-01-30 13:00:00").id
end

end
