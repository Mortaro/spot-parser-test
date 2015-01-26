require 'ostruct'

class Mock < OpenStruct

  attr_accessor :title

  def initialize title
    @title = title
  end

  def method_missing(method_name, *arguments, &block)
    if title == 'promoter' && !%w[name birthday city uf cpf rg work_id work_serial work_emission work_uf].include?(method_name.to_s) || title == 'store' && !%w[chain branch_number fantasy_name corporate_name cnpj address number complement zip_code neighborhood city uf phone state_registration municipal_registration].include?(method_name.to_s)
      raise "#{title} does not respond_to .#{method_name}, please review https://gist.github.com/Mortaro/dc14f45e0d089c31eafe"
    end
    "[#{title} :#{method_name}]"
  end

  def [] key
    return "http://www.spotpromo.com.br/sitenew/Content/images/logo.png" if key.to_s == 'logo'
    "[#{title} :#{key}]"
  end

  def delete key
    Mock.new key.to_s
  end

end
