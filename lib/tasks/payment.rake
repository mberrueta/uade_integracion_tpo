# rubocop:disable Metrics/BlockLength
namespace :billing do
  desc 'This task is to generate the invoices for all the students'
  task :payment, %i[year month] => [:environment] do |_t, args|
    raise StandardError, '`year` is required !!!' unless args[:year]
    raise StandardError, '`month` is required !!!' unless args[:month]

    spinner = TTY::Spinner::Multi.new(
      '[:spinner] Invoice Creation started', format: :dots_2
    )
    spinner.auto_spin

    Student.joins(:holder).where(holders: { payment_method: 'DEBITO_AUTOMATICO' }).each do |student|
      sp = spinner.register("[:spinner] #{student.last_name} #{student.name}. ")
      sp.auto_spin
      unless student.holder.cbu
        sp.error('holder `cbu` is missing !!!')
        next
      end
      i = student.invoices.where(month: args[:month], year: args[:year]).first
      result = Services::Payment.new.charge_account(student.holder.cbu, i.total)
      if result[:error]
          sp.error(result[:error])
      else
        p = Payment.new(
          invoice: i,
          date: Time.now,
          amount: i.total,
          payment_method: 'DEBITO_AUTOMATICO',
          transaction_id: result[:transaction_id]
        )
        if p.save
          sp.success("OK")
        else
          sp.error(i.errors.full_messages.to_s)
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
