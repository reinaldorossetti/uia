module Uia
  class InvalidControlType < StandardError
    def initialize(control_type)
      super "#{control_type} is not valid"
    end
  end

  module Library
    module Constants
      Patterns = {
          :annotation => 10023,
          :dock => 10011,
          :drag => 10030,
          :drop_target => 10031,
          :expand_collapse => 10005,
          :grid_item => 10007,
          :grid => 10006,
          :invoke => 10000,
          :item_container => 10019,
          :legacy_i_accessible => 10018,
          :multiple_view => 10008,
          :object_model => 10022,
          :range_value => 10003,
          :scroll_item => 10017,
          :scroll => 10004,
          :selection_item => 10010,
          :selection => 10001,
          :spreadsheet => 10026,
          :spreadsheet_item => 10027,
          :styles => 10025,
          :synchronized_input => 10021,
          :table_item => 10013,
          :table => 10012,
          :text_child => 10029,
          :text_edit => 10032,
          :text => 10014,
          :text_pattern2 => 10024,
          :toggle => 10015,
          :transform => 10016,
          :transform_pattern2 => 10028,
          :value => 10002,
          :virtualized_item => 10020,
          :window => 10009
      }

      ControlTypes = {
          :app_bar => 50040,
          :button => 50000,
          :calendar => 50001,
          :check_box => 50002,
          :combo_box => 50003,
          :custom => 50025,
          :data_grid => 50028,
          :data_item => 50029,
          :document => 50030,
          :edit => 50004,
          :group => 50026,
          :header => 50034,
          :header_item => 50035,
          :hyperlink => 50005,
          :image => 50006,
          :list => 50008,
          :list_item => 50007,
          :menu_bar => 50010,
          :menu => 50009,
          :menu_item => 50011,
          :pane => 50033,
          :progress_bar => 50012,
          :radio_button => 50013,
          :scroll_bar => 50014,
          :semantic_zoom => 50039,
          :separator => 50038,
          :slider => 50015,
          :spinner => 50016,
          :split_button => 50031,
          :status_bar => 50017,
          :tab => 50018,
          :tab_item => 50019,
          :table => 50036,
          :text => 50020,
          :thumb => 50027,
          :title_bar => 50037,
          :tool_bar => 50021,
          :tool_tip => 50022,
          :tree => 50023,
          :tree_item => 50024,
          :window => 50032
      }
    end
  end
end