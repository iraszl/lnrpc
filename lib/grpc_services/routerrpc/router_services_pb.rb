# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: routerrpc/router.proto for package 'routerrpc'

require 'grpc'
require 'routerrpc/router_pb'

module Routerrpc
  module Router
    # Router is a service that offers advanced interaction with the router
    # subsystem of the daemon.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'routerrpc.Router'

      #
      # SendPaymentV2 attempts to route a payment described by the passed
      # PaymentRequest to the final destination. The call returns a stream of
      # payment updates.
      rpc :SendPaymentV2, ::Routerrpc::SendPaymentRequest, stream(::Lnrpc::Payment)
      #
      # TrackPaymentV2 returns an update stream for the payment identified by the
      # payment hash.
      rpc :TrackPaymentV2, ::Routerrpc::TrackPaymentRequest, stream(::Lnrpc::Payment)
      #
      # EstimateRouteFee allows callers to obtain a lower bound w.r.t how much it
      # may cost to send an HTLC to the target end destination.
      rpc :EstimateRouteFee, ::Routerrpc::RouteFeeRequest, ::Routerrpc::RouteFeeResponse
      #
      # Deprecated, use SendToRouteV2. SendToRoute attempts to make a payment via
      # the specified route. This method differs from SendPayment in that it
      # allows users to specify a full route manually. This can be used for
      # things like rebalancing, and atomic swaps. It differs from the newer
      # SendToRouteV2 in that it doesn't return the full HTLC information.
      rpc :SendToRoute, ::Routerrpc::SendToRouteRequest, ::Routerrpc::SendToRouteResponse
      #
      # SendToRouteV2 attempts to make a payment via the specified route. This
      # method differs from SendPayment in that it allows users to specify a full
      # route manually. This can be used for things like rebalancing, and atomic
      # swaps.
      rpc :SendToRouteV2, ::Routerrpc::SendToRouteRequest, ::Lnrpc::HTLCAttempt
      #
      # ResetMissionControl clears all mission control state and starts with a clean
      # slate.
      rpc :ResetMissionControl, ::Routerrpc::ResetMissionControlRequest, ::Routerrpc::ResetMissionControlResponse
      #
      # QueryMissionControl exposes the internal mission control state to callers.
      # It is a development feature.
      rpc :QueryMissionControl, ::Routerrpc::QueryMissionControlRequest, ::Routerrpc::QueryMissionControlResponse
      #
      # XImportMissionControl is an experimental API that imports the state provided
      # to the internal mission control's state, using all results which are more
      # recent than our existing values. These values will only be imported
      # in-memory, and will not be persisted across restarts.
      rpc :XImportMissionControl, ::Routerrpc::XImportMissionControlRequest, ::Routerrpc::XImportMissionControlResponse
      #
      # GetMissionControlConfig returns mission control's current config.
      rpc :GetMissionControlConfig, ::Routerrpc::GetMissionControlConfigRequest, ::Routerrpc::GetMissionControlConfigResponse
      #
      # SetMissionControlConfig will set mission control's config, if the config
      # provided is valid.
      rpc :SetMissionControlConfig, ::Routerrpc::SetMissionControlConfigRequest, ::Routerrpc::SetMissionControlConfigResponse
      #
      # QueryProbability returns the current success probability estimate for a
      # given node pair and amount.
      rpc :QueryProbability, ::Routerrpc::QueryProbabilityRequest, ::Routerrpc::QueryProbabilityResponse
      #
      # BuildRoute builds a fully specified route based on a list of hop public
      # keys. It retrieves the relevant channel policies from the graph in order to
      # calculate the correct fees and time locks.
      rpc :BuildRoute, ::Routerrpc::BuildRouteRequest, ::Routerrpc::BuildRouteResponse
      #
      # SubscribeHtlcEvents creates a uni-directional stream from the server to
      # the client which delivers a stream of htlc events.
      rpc :SubscribeHtlcEvents, ::Routerrpc::SubscribeHtlcEventsRequest, stream(::Routerrpc::HtlcEvent)
      #
      # Deprecated, use SendPaymentV2. SendPayment attempts to route a payment
      # described by the passed PaymentRequest to the final destination. The call
      # returns a stream of payment status updates.
      rpc :SendPayment, ::Routerrpc::SendPaymentRequest, stream(::Routerrpc::PaymentStatus)
      #
      # Deprecated, use TrackPaymentV2. TrackPayment returns an update stream for
      # the payment identified by the payment hash.
      rpc :TrackPayment, ::Routerrpc::TrackPaymentRequest, stream(::Routerrpc::PaymentStatus)
      # *
      # HtlcInterceptor dispatches a bi-directional streaming RPC in which
      # Forwarded HTLC requests are sent to the client and the client responds with
      # a boolean that tells LND if this htlc should be intercepted.
      # In case of interception, the htlc can be either settled, cancelled or
      # resumed later by using the ResolveHoldForward endpoint.
      rpc :HtlcInterceptor, stream(::Routerrpc::ForwardHtlcInterceptResponse), stream(::Routerrpc::ForwardHtlcInterceptRequest)
      #
      # UpdateChanStatus attempts to manually set the state of a channel
      # (enabled, disabled, or auto). A manual "disable" request will cause the
      # channel to stay disabled until a subsequent manual request of either
      # "enable" or "auto".
      rpc :UpdateChanStatus, ::Routerrpc::UpdateChanStatusRequest, ::Routerrpc::UpdateChanStatusResponse
    end

    Stub = Service.rpc_stub_class
  end
end
