class Reservation < ActiveRecord::Base
  belongs_to :table
  belongs_to :user
  validates :table_id, :presence => true
  validates :user_id, :presence => true
  validate :start_time_is_in_the_future,
      :end_time_after_start_time,
      :table_is_not_occupied

  def start_time_is_in_the_future
    errors.add(:start_time, 'Start time should be in the future') if
        DateTime.now >= start_time
  end

  def end_time_after_start_time
    errors.add(:end_time, 'End time should be bigger then start time') if
        start_time >= end_time
  end

  def table_is_not_occupied
    errors.add(:occupied, 'The table is occupied') if
        Reservation.where("table_id = :table_id AND NOT (end_time <= :start_time AND end_time < :end_time OR start_time >= :end_time AND start_time > :start_time)",
                          {start_time: start_time, end_time: end_time, table_id: table_id}).count > 0
  end
end
