# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: walletunlocker.proto

require 'google/protobuf'

require 'lightning_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("walletunlocker.proto", :syntax => :proto3) do
    add_message "lnrpc.GenSeedRequest" do
      optional :aezeed_passphrase, :bytes, 1
      optional :seed_entropy, :bytes, 2
    end
    add_message "lnrpc.GenSeedResponse" do
      repeated :cipher_seed_mnemonic, :string, 1
      optional :enciphered_seed, :bytes, 2
    end
    add_message "lnrpc.InitWalletRequest" do
      optional :wallet_password, :bytes, 1
      repeated :cipher_seed_mnemonic, :string, 2
      optional :aezeed_passphrase, :bytes, 3
      optional :recovery_window, :int32, 4
      optional :channel_backups, :message, 5, "lnrpc.ChanBackupSnapshot"
      optional :stateless_init, :bool, 6
      optional :extended_master_key, :string, 7
      optional :extended_master_key_birthday_timestamp, :uint64, 8
      optional :watch_only, :message, 9, "lnrpc.WatchOnly"
    end
    add_message "lnrpc.InitWalletResponse" do
      optional :admin_macaroon, :bytes, 1
    end
    add_message "lnrpc.WatchOnly" do
      optional :master_key_birthday_timestamp, :uint64, 1
      optional :master_key_fingerprint, :bytes, 2
      repeated :accounts, :message, 3, "lnrpc.WatchOnlyAccount"
    end
    add_message "lnrpc.WatchOnlyAccount" do
      optional :purpose, :uint32, 1
      optional :coin_type, :uint32, 2
      optional :account, :uint32, 3
      optional :xpub, :string, 4
    end
    add_message "lnrpc.UnlockWalletRequest" do
      optional :wallet_password, :bytes, 1
      optional :recovery_window, :int32, 2
      optional :channel_backups, :message, 3, "lnrpc.ChanBackupSnapshot"
      optional :stateless_init, :bool, 4
    end
    add_message "lnrpc.UnlockWalletResponse" do
    end
    add_message "lnrpc.ChangePasswordRequest" do
      optional :current_password, :bytes, 1
      optional :new_password, :bytes, 2
      optional :stateless_init, :bool, 3
      optional :new_macaroon_root_key, :bool, 4
    end
    add_message "lnrpc.ChangePasswordResponse" do
      optional :admin_macaroon, :bytes, 1
    end
  end
end

module Lnrpc
  GenSeedRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.GenSeedRequest").msgclass
  GenSeedResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.GenSeedResponse").msgclass
  InitWalletRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.InitWalletRequest").msgclass
  InitWalletResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.InitWalletResponse").msgclass
  WatchOnly = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.WatchOnly").msgclass
  WatchOnlyAccount = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.WatchOnlyAccount").msgclass
  UnlockWalletRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.UnlockWalletRequest").msgclass
  UnlockWalletResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.UnlockWalletResponse").msgclass
  ChangePasswordRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.ChangePasswordRequest").msgclass
  ChangePasswordResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("lnrpc.ChangePasswordResponse").msgclass
end
