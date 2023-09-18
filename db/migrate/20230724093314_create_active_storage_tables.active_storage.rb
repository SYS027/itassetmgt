class CreateActiveStorageTables < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_blobs, id: :uuid do |t| # Changed the primary key type to :uuid
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum
      t.timestamp :created_at, null: false, precision: 6 # Use precision for timestamp

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments, id: :uuid do |t| # Changed the primary key type to :uuid
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false, type: :uuid # Changed the foreign key type to :uuid
      t.references :blob,     null: false, type: :uuid # Changed the foreign key type to :uuid
      t.timestamp :created_at, null: false, precision: 6 # Use precision for timestamp

      t.index [ :record_type, :record_id, :name, :blob_id ], name: :index_active_storage_attachments_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end

    create_table :active_storage_variant_records, id: :uuid do |t| # Changed the primary key type to :uuid
      t.belongs_to :blob, null: false, index: false, type: :uuid # Changed the foreign key type to :uuid
      t.string :variation_digest, null: false

      t.index [ :blob_id, :variation_digest ], name: :index_active_storage_variant_records_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end
