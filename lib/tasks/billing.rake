# rubocop:disable Metrics/BlockLength
namespace :billing do
  desc 'This task is to generate the invoices for all the students'
  
  task :invoice, %i[year month] => [:environment] do |_t, args|
    raise StandardError, '`year` is required !!!' unless args[:year]
    raise StandardError, '`month` is required !!!' unless args[:month]

    spinner = TTY::Spinner::Multi.new(
      '[:spinner] Invoice Creation started', format: :dots_2
    )
    spinner.auto_spin

    Student.joins(:services).distinct.each do |student|
      sp = spinner.register("[:spinner] #{student.last_name} #{student.name}. ")
      sp.auto_spin
      i =
        Invoice.new(
          student: student,
          year: args[:year],
          month: args[:month]
        ).tap do |invoice|
          student.services.each do |service|
            invoice.items << Item.new(
              service: service,
              price: service.price
            )
          end
        end

      if i.save
        sp.success('OK')
      else
        sp.error(i.errors.full_messages.to_s)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
