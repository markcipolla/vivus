require 'spec_helper'

describe Stylesheet do
  describe "#parse" do
    let(:css) {
<<-eos
select attr1, attr2, attr3, attr4, attr5, attr6, attr7
from table1, table2, table3, etc, etc, etc, etc, etc,
where etc etc etc etc etc etc etc etc etc etc etc etc etc
eos
    }
  end
end
