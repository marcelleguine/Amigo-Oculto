# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Group do
  fixtures :groups
  before(:each) do
    @valido = {:name => 'Infomarka'}
    @group = Group.new @valido
  end

  it "deve ser um grupo válido" do
    @group.valid?.should be_true
  end

  it 'não pode ter nome vazio' do
    @group[:name] = ''
    @group.valid?.should be_false
  end

end