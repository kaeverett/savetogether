module BeneficiariesHelper
  def statement_column(record)
    if (record.statement != nil)
      record.statement.gsub("\n", "<br />")
    end
  end
end